import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/localization/localization_methods.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/notification/presentation/screen/notification_screen.dart';
import 'package:wein_buyer/view/user/addresses/presentation/controller/addresses_cubit.dart';
import 'package:wein_buyer/view/user/addresses/presentation/screen/addresses_screen.dart';
import 'package:wein_buyer/view/user/products/presentation/controller/products_cubit.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import 'package:wein_buyer/widgets/space_width.dart';
import '../../../../../../../widgets/snackBar.dart';
import '../../../../../core/utils/app_strings.dart';
import 'bottom_sheet_list_of_address_widget.dart';
import 'search_screen.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getProportionateScreenWidth(20),
        vertical: AppSizes.getProportionateScreenHeight(10),
      ),
      child: Column(
        children: [
          SpaceH(inputHeigth: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  if (AppStorage.isLogged) {
                    AddressesCubit.of(context).listOfAddress.isEmpty
                        ? MagicRouter.navigateTo(const AddressesScreen())
                        : showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            builder: (BuildContext conxt) {
                              return BlocProvider.value(
                                value: AddressesCubit.of(context),
                                child: const BottomSheetListOfAddressWidget(),
                              );
                            },
                          );
                  } else {
                    showSnackBar(AppStrings.pleaseLogin.translate(),
                        pleaseLogin: true);
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: AppSizes.getProportionateScreenWidth(25),
                      ),
                      child: Text(
                        tr(context, AppStrings.deliveryTo),
                        style: TextStyle(
                          color: AppColors.transparntColor255,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.transparntColor255,
                        ),
                        BlocBuilder<AddressesCubit, AddressesState>(
                          buildWhen: (previous, current) =>
                              previous != current ||
                              current is OnSelectedAddressItemDefaultState,
                          builder: (context, state) {
                            return Text(
                              AppStorage.isLogged
                                  ? AddressesCubit.of(context)
                                          .listOfAddress
                                          .isEmpty
                                      ? AppStrings.addANewAddress.translate()
                                      : AddressesCubit.of(context)
                                              .listOfAddress
                                              .firstWhere((element) =>
                                                  element.isDefault == true)
                                              .nearestAddress ??
                                          ''
                                  : AppStrings.pleaseLogin.translate(),
                              style: TextStyle(
                                color: AppColors.transparntColor255,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.transparntColor255,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  if (AppStorage.isLogged) {
                    MagicRouter.navigateTo(const NotificationScreen());
                  } else {
                    showSnackBar(AppStrings.pleaseLogin.translate(),
                        pleaseLogin: true);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.getProportionateScreenWidth(20),
                    vertical: AppSizes.getProportionateScreenHeight(5),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(
                        AppSizes.getProportionateScreenWidth(12)),
                    decoration: BoxDecoration(
                      color: AppColors.transparntColor255.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SpaceH(inputHeigth: 5),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              return state is GetProductsLoading
                  ? const SizedBox()
                  : InkWell(
                      onTap: () {
                        showSearch(
                          context: context,
                          delegate: SearchScreen(
                              ProductsCubit.of(context).listOfProducts),
                        );
                      },
                      child: Container(
                        height: AppSizes.getProportionateScreenHeight(45),
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.getProportionateScreenWidth(10),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.search,
                              color: AppColors.GrayColor161,
                            ),
                            SpaceW(inputWidth: 5),
                            Text(
                              AppStrings.whaaaatASearch.translate(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.GrayColor161,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
