import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../../../widgets/tab_widget.dart';
import '../../../../../core/utils/app_strings.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TabWidget(),
            SpaceW(inputWidth: 10),
            Text(
              AppStrings.paymentMethodWidget.translate(),
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.fontColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SpaceH(inputHeigth: 10),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizes.getProportionateScreenHeight(20),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.money_bill),
                      SpaceH(inputHeigth: 10),
                      Text(
                        AppStrings.costOrderCash.translate(),
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SpaceW(inputWidth: 10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizes.getProportionateScreenHeight(20),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.transparntColor255,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.credit_card),
                      SpaceH(inputHeigth: 10),
                      Text(
                        AppStrings.costOrderOnline.translate(),
                        style: TextStyle(
                          color: AppColors.GrayColor161,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
