import 'package:flutter/material.dart';
import 'package:wein_buyer/core/localization/localization_methods.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            key: key,
            backgroundColor: Colors.black54,
            children: [
              Center(
                child: Column(
                  children: [
                    const CircularProgressIndicator(color: AppColors.primaryColor),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      tr(context, AppStrings.pleaseWait),
                      style: const TextStyle(color: AppColors.primaryColor),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
