import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/user/cart/presentation/screen/delivery_address_and_payment_method_screen.dart';
import 'package:wein_buyer/widgets/custom_button.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../core/appStorage/app_storage.dart';
import '../../../../../core/utils/app_strings.dart';
import '../controller/cart_cubit.dart';

class TotalPriceCartWidget extends StatelessWidget {
  const TotalPriceCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<CartCubit, CartState>(
          buildWhen: (previous, current) =>
              previous != current ||
              current is UpdateItemQuantityLoaded ||
              current is RemoveItemLoaded,
          builder: (context, state) {
            return state is GetCartLoading
                ? const SizedBox()
                : Container(
                    color: AppColors.GrayColor239,
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.getProportionateScreenHeight(15),
                      horizontal: AppSizes.getProportionateScreenWidth(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.priceCostOrderWidget.translate(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.fontColor,
                              ),
                            ),
                            Text(
                              '${CartCubit.of(context).cartModel!.price} ${AppStorage.getSelectedUserCurrency!.code}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.fontColor,
                              ),
                            ),
                          ],
                        ),
                        SpaceH(inputHeigth: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.driveCostOrderWidget.translate(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.fontColor,
                              ),
                            ),
                            Text(
                              '${CartCubit.of(context).cartModel!.delivery} ${AppStorage.getSelectedUserCurrency!.code}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.fontColor,
                              ),
                            ),
                          ],
                        ),
                        SpaceH(inputHeigth: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppStrings.totalCostOrderWidget.translate(),
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.fontColor,
                                  ),
                                ),
                                Text(
                                  '(  ${AppStrings.taxesCostOrderWidget.translate()} )',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.GrayColor112,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${CartCubit.of(context).cartModel!.total} ${CartCubit.of(context).cartModel!.currency}',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.getProportionateScreenHeight(10),
            horizontal: AppSizes.getProportionateScreenWidth(30),
          ),
          child: CustomButton(
            text: AppStrings.nextWidget.translate(),
            paddingVertical: 17,
            onPress: () {
              MagicRouter.navigateTo(
                BlocProvider.value(
                  value: CartCubit.of(context),
                  child: const DeliveryAddressAndPaymentMethodScreen(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
