import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import '../../../../../../../core/router/router.dart';
import '../../../../../../../core/utils/app_assets.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../core/utils/app_strings.dart';

class ReturnsBottomSheet extends StatefulWidget {
  const ReturnsBottomSheet({Key? key}) : super(key: key);

  @override
  State<ReturnsBottomSheet> createState() => _ReturnsBottomSheetState();
}

class _ReturnsBottomSheetState extends State<ReturnsBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.screenHeight * 0.35,
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
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppSizes.getProportionateScreenHeight(20),
                  horizontal: AppSizes.getProportionateScreenWidth(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.resionOfReturn.translate(),
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: AppColors.fontColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SpaceH(inputHeigth: 20),
                    Container(
                      child: Text(
                        AppStrings.text.translate(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.GrayColor112,
                          fontSize: 14.sp,
                        ),
                      ),
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
