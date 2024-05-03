import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/view/provider/bottom_nav_provider/presentation/screens/bottom_nav_provider_screen.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../../core/utils/app_sizes.dart';

class DoneReturnOrderBottomSheet extends StatefulWidget {
  const DoneReturnOrderBottomSheet({Key? key}) : super(key: key);

  @override
  State<DoneReturnOrderBottomSheet> createState() =>
      _DoneReturnOrderBottomSheetState();
}

class _DoneReturnOrderBottomSheetState
    extends State<DoneReturnOrderBottomSheet> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      MagicRouter.navigateAndPopAll(BottomNavProviderScreen(selectedIndex: 0));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.screenHeight * 0.3,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.getProportionateScreenHeight(20),
          horizontal: AppSizes.getProportionateScreenWidth(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppAssets.doneLottie,
              height: AppSizes.getProportionateScreenHeight(80),
              width: AppSizes.getProportionateScreenWidth(80),
            ),
            SpaceH(inputHeigth: 20),
            Container(
              child: Text(
                '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.fontColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
