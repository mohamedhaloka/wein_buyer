import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/user/home/presentation/widget/address_home_item.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import 'package:wein_buyer/widgets/space_width.dart';

import '../../../../../core/utils/app_strings.dart';

class BottomSheetFilterWidget extends StatefulWidget {
  const BottomSheetFilterWidget({Key? key}) : super(key: key);

  @override
  State<BottomSheetFilterWidget> createState() =>
      _BottomSheetFilterWidgetState();
}

class _BottomSheetFilterWidgetState extends State<BottomSheetFilterWidget> {
  var priceSelectedRange = RangeValues(0.2, 0.6);
  var rangeSelectedRange = RangeValues(0.4, 0.9);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.screenHeight * 0.55,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              MagicRouter.pop();
            },
            child: Image.asset(AppAssets.exit_icon),
          ),
          SpaceH(inputHeigth: 15),
          Expanded(
            child: Container(
              width: AppSizes.screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.getProportionateScreenWidth(25),
                vertical: AppSizes.getProportionateScreenHeight(20),
              ),
              child: Column(
                children: [
                  Text(
                    AppStrings.filter.translate(),
                    style: TextStyle(
                      color: AppColors.fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  SpaceH(inputHeigth: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.getProportionateScreenHeight(5),
                        ),
                        child: Text(
                          AppStrings.productPrice.translate(),
                          style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SpaceH(inputHeigth: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${(priceSelectedRange.start * 1000).toInt()}ج',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.fontColor,
                            ),
                          ),
                          Text(
                            '${(priceSelectedRange.end * 1000).toInt()}ج',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.fontColor,
                            ),
                          ),
                        ],
                      ),
                      RangeSlider(
                        values: priceSelectedRange,
                        activeColor: AppColors.primaryColor,
                        inactiveColor: AppColors.GrayColor161,
                        divisions: 1000,
                        labels: RangeLabels(
                            '${(priceSelectedRange.start * 1000).toInt()}ج',
                            '${(priceSelectedRange.end * 1000).toInt()}ج'),
                        onChanged: (newRange) {
                          setState(() {
                            priceSelectedRange = newRange;
                          });
                        },
                      ),
                      SpaceH(inputHeigth: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.getProportionateScreenHeight(5),
                        ),
                        child: Text(
                          AppStrings.searchInSide.translate(),
                          style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SpaceH(inputHeigth: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${(rangeSelectedRange.start * 100).toInt()}${AppStrings.kilo.translate()}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.fontColor,
                            ),
                          ),
                          Text(
                            '${(rangeSelectedRange.end * 100).toInt()}${AppStrings.kilo.translate()}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.fontColor,
                            ),
                          ),
                        ],
                      ),
                      RangeSlider(
                        values: rangeSelectedRange,
                        activeColor: AppColors.primaryColor,
                        inactiveColor: AppColors.GrayColor161,
                        divisions: 100,
                        labels: RangeLabels(
                            '${(rangeSelectedRange.start * 100).toInt()}${AppStrings.kilo.translate()}',
                            '${(rangeSelectedRange.end * 100).toInt()}${AppStrings.kilo.translate()}'),
                        onChanged: (newRange) {
                          setState(() {
                            rangeSelectedRange = newRange;
                            print(newRange);
                          });
                        },
                      ),
                    ],
                  ),
                  SpaceH(inputHeigth: 15),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: AppStrings.filter.translate(),
                          paddingVertical: 15,
                          onPress: () {},
                        ),
                      ),
                      SpaceW(inputWidth: 10),
                      Expanded(
                        child: CustomButton(
                          text: AppStrings.deleteFilter.translate(),
                          paddingVertical: 15,
                          fontColor: AppColors.primaryColor,
                          buttonColor: AppColors.primaryColor.withOpacity(0.2),
                          onPress: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
