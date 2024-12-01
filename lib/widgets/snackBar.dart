import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import '../core/router/router.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_strings.dart';
import '../view/select_user/presentation/screens/select_user_screen.dart';

showSnackBar(
  String massage, {
  bool popPage = false,
  duration = 5,
  Color color = AppColors.primaryColor,
  bool pleaseLogin = false,
}) {
  String snackBarMessage = () {
    switch (massage) {
      case 'unauthenticated':
        return AppStrings.pleaseLogin.translate();
      default:
        return massage;
    }
  }();

  ScaffoldMessenger.of(MagicRouter.currentContext!).hideCurrentSnackBar();
  ScaffoldMessenger.of(MagicRouter.currentContext!).showSnackBar(
    SnackBar(
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      content: InkWell(
        onTap: massage == 'unauthenticated' ? AppStorage.signOut : null,
        child: Text(snackBarMessage),
      ),
      action: pleaseLogin
          ? SnackBarAction(
              label: AppStrings.logout.translate(),
              onPressed: () =>
                  MagicRouter.navigateAndPopAll(const SelectUserScreen()),
            )
          : null,
      duration: Duration(seconds: duration),
    ),
  );
  if (popPage) Timer(const Duration(seconds: 5), () => MagicRouter.pop());
}
