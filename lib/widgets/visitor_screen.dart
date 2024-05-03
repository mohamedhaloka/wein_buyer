import 'package:flutter/material.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/view/select_user/presentation/screens/select_user_screen.dart';
import 'package:wein_buyer/view/user/login_user/presentation/screen/login_user_screen.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../core/utils/app_sizes.dart';
import '../core/utils/app_strings.dart';

class VisitorScreen extends StatelessWidget {
  VisitorScreen({Key? key, this.isScreen = false}) : super(key: key);

  bool isScreen;

  @override
  Widget build(BuildContext context) {
    if (isScreen) {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.logout,
                scale: 3,
              ),
              SpaceH(inputHeigth: 30),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.getProportionateScreenWidth(30)),
                child: CustomButton(
                  text: AppStrings.pleaseLogin.translate(),
                  radius: 5,
                  borderColor: AppColors.primaryColor,
                  fontColor: AppColors.primaryColor,
                  buttonColor: Colors.white,
                  onPress: () {
                    MagicRouter.navigateAndPopAll(const SelectUserScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.logout,
              scale: 3,
            ),
            SpaceH(inputHeigth: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.getProportionateScreenWidth(30)),
              child: CustomButton(
                text: AppStrings.pleaseLogin.translate(),
                radius: 5,
                borderColor: AppColors.primaryColor,
                fontColor: AppColors.primaryColor,
                buttonColor: Colors.white,
                onPress: () {
                  MagicRouter.navigateAndPopAll(const SelectUserScreen());
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}
