import 'package:flutter/material.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';

import '../../../../../../../core/utils/app_assets.dart';
import '../../../../../../../core/utils/app_sizes.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      width: AppSizes.screenWidth,
      height: AppSizes.screenHeight,
      child: Image.asset(
        AppAssets.logo,
      ),
    );
  }
}
