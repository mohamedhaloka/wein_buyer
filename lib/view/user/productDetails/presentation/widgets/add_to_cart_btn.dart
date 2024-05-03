import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/product.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/controller/product_details_cubit.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';

import '../../../../../../../core/models/product_details.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/custom_button.dart';
import '../../../../../../../widgets/snackBar.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../addresses/presentation/controller/addresses_cubit.dart';

class AddToCartBTN extends StatelessWidget {
  const AddToCartBTN({Key? key, required this.productDetailsModel})
      : super(key: key);

  final ProductDetails productDetailsModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressesCubit, AddressesState>(
      builder: (context, state) {
        return state is GetAddressesLoaded
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          ProductDetailsCubit.of(context).increaseQuantity();
                        },
                        child: Container(
                          padding: EdgeInsets.all(
                            AppSizes.getProportionateScreenWidth(10),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.fontColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SpaceW(inputWidth: 15),
                      BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                        buildWhen: (previous, current) =>
                            previous != current ||
                            current is IncreaseQuantityState ||
                            current is IncreaseQuantityState,
                        builder: (context, state) {
                          return Text(
                            ProductDetailsCubit.of(context).quantity.toString(),
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColors.fontColor,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                      SpaceW(inputWidth: 15),
                      InkWell(
                        onTap: () {
                          ProductDetailsCubit.of(context).decreaseQuantity();
                        },
                        child: Container(
                          padding: EdgeInsets.all(
                            AppSizes.getProportionateScreenWidth(10),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                    builder: (context, state) {
                      return state is AddToCartLoading
                          ? const LoadingIndicator()
                          : CustomButton(
                              text: AppStrings.addToBasket.translate(),
                              paddingVertical:
                                  AppSizes.getProportionateScreenWidth(15),
                              paddinghorizontal:
                                  AppSizes.getProportionateScreenWidth(40),
                              onPress: () {
                                if (AppStorage.isLogged) {
                                  if (AddressesCubit.of(context)
                                      .listOfAddress
                                      .isEmpty) {
                                    showSnackBar(
                                        AppStrings.addANewAddress.translate());
                                    return;
                                  }
                                  String? lat = AddressesCubit.of(context)
                                      .listOfAddress
                                      .firstWhere((element) =>
                                          element.isDefault == true)
                                      .lat;
                                  String? lng = AddressesCubit.of(context)
                                      .listOfAddress
                                      .firstWhere((element) =>
                                          element.isDefault == true)
                                      .lng;
                                  ProductDetailsCubit.of(context).addToCart(
                                    productDetailsModel.product!.id!,
                                    ProductDetailsCubit.of(context).quantity,
                                    double.parse(lat ?? '0.0'),
                                    double.parse(lng ?? '0.0'),
                                  );
                                } else {
                                  showSnackBar(
                                    AppStrings.pleaseLogin.translate(),
                                    pleaseLogin: true,
                                  );
                                }
                              },
                            );
                    },
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
