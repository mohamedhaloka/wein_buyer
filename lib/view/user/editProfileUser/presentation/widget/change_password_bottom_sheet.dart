import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/bottom_nav_user/presentation/screens/bottom_nav_user_screen.dart';
import '../../../../../../../core/router/router.dart';
import '../../../../../../../core/utils/app_assets.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../core/utils/app_strings.dart';

class ChangePasswordBottomSheet extends StatefulWidget {
  const ChangePasswordBottomSheet({Key? key}) : super(key: key);

  @override
  State<ChangePasswordBottomSheet> createState() =>
      _ChangePasswordBottomSheetState();
}

class _ChangePasswordBottomSheetState
    extends State<ChangePasswordBottomSheet> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      MagicRouter.navigateAndPopAll(BottomNavUserScreen(selectedIndex: 0));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.screenHeight * 0.27,
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
              AppAssets.done_lottie,
              height: AppSizes.getProportionateScreenHeight(100),
              width: AppSizes.getProportionateScreenWidth(100),
            ),
            SpaceH(inputHeigth: 20),
            Container(
              child: Text(
                AppStrings.changePasswordBottomSheet.translate(),
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
