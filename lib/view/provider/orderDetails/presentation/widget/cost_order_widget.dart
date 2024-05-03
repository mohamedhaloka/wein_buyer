import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../core/models/orders_model.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';

class CostOrderWidget extends StatelessWidget {
  const CostOrderWidget({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(10),
        horizontal: AppSizes.getProportionateScreenWidth(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.costOrderWidget.translate(),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.fontColor,
                ),
              ),
              Text(
                order.paymentMethodText??'',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.GrayColor112,
                ),
              ),
            ],
          ),
          SpaceH(inputHeigth: 5),
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
                '${order.price} ${order.currencyCode}',
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
                '${order.deliveryPrice} ${order.currencyCode}',
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
                '${order.totalPrice} ${order.currencyCode}',
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
  }
}
