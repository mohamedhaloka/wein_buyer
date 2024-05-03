import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/user/home/presentation/widget/address_home_item.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../core/utils/app_strings.dart';

class BottomSheetSortByWidget extends StatelessWidget {
  const BottomSheetSortByWidget({Key? key}) : super(key: key);

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
                    AppStrings.bottomSheetSortByWidget.translate(),
                    style: TextStyle(
                      color: AppColors.fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  SpaceH(inputHeigth: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.getProportionateScreenHeight(5),
                        ),
                        child: Text(
                          AppStrings.recent.translate(),
                          style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.getProportionateScreenHeight(5),
                        ),
                        child: Text(
                          AppStrings.recent.translate(),
                          style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.getProportionateScreenHeight(5),
                        ),
                        child: Text(
                          AppStrings.recent.translate(),
                          style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.getProportionateScreenHeight(5),
                        ),
                        child: Text(
                          AppStrings.recent.translate(),
                          style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.getProportionateScreenHeight(5),
                        ),
                        child: Text(
                          AppStrings.recent.translate(),
                          style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
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
