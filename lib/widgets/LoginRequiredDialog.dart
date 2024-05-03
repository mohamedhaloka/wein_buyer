import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/view/user/login_user/presentation/screen/login_user_screen.dart';

import '../core/utils/app_strings.dart';

loginRequiredDialog(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        alignment: Alignment.center,
        title: Text(
          AppStrings.logInFirst.translate(),
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
          ),
        ),
        content: ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginUserScreen()),
                (route) => false);
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
            AppColors.primaryColor,
          )),
          child: Text(
            AppStrings.login.translate(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
        ),
      );
    },
  );
}
