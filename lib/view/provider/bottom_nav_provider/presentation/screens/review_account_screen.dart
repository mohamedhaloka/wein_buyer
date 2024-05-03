import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import 'package:wein_buyer/widgets/space_width.dart';

import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';

class ReviewAccountScreen extends StatelessWidget {
  const ReviewAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getProportionateScreenWidth(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppAssets.reviewAccount),
                SpaceH(inputHeigth: 20),
                Text(
                  AppStrings.reviewAccountTitle.translate(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.fontColor,
                  ),
                ),
                SpaceH(inputHeigth: 15),
                Text(
                  AppStrings.reviewAccountDesc.translate(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.GrayColor161,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: AppSizes.getProportionateScreenHeight(30),
            left: AppSizes.getProportionateScreenWidth(15),
            child: InkWell(
              onTap: () {
                AppStorage.signOut();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppSizes.getProportionateScreenHeight(10),
                  horizontal: AppSizes.getProportionateScreenWidth(10),
                ),
                child: Row(
                  children: [
                    Text(AppAssets.logout.translate()),
                    SpaceW(inputWidth: 5),
                    const Icon(
                      Icons.logout,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
