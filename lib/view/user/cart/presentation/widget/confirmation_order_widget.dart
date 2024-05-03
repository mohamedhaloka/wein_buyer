import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';

import '../../../../../../../core/models/cart_model.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/custom_button.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../../../widgets/tab_widget.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../addresses/presentation/controller/addresses_cubit.dart';
import '../controller/cart_cubit.dart';

class ConfirmationOrderWidget extends StatelessWidget {
  const ConfirmationOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const TabWidget(),
            SpaceW(inputWidth: 10),
            Text(
              AppStrings.confirmationOrderWidget.translate(),
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.fontColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SpaceH(inputHeigth: 10),
        Container(
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
                    '${CartCubit.of(context).cartModel!.price} ${CartCubit.of(context).cartModel!.currency}',
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
                    '${CartCubit.of(context).cartModel!.delivery} ${CartCubit.of(context).cartModel!.currency}',
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
                        '( ${AppStrings.taxesCostOrderWidget.translate()} )',
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
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.getProportionateScreenHeight(10),
            horizontal: AppSizes.getProportionateScreenWidth(30),
          ),
          child: CustomButton(
            text: AppStrings.confirmOrder.translate(),
            paddingVertical: 17,
            onPress: () {
              print(AddressesCubit.of(context)
                  .listOfAddress
                  .firstWhere((element) => element.isDefault == true)
                  .id);
              CartCubit.of(context).chechout(AddressesCubit.of(context)
                      .listOfAddress
                      .firstWhere((element) => element.isDefault == true)
                      .id ??
                  0);
            },
          ),
        ),
      ],
    );
  }
}
