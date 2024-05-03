import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';

import '../../../../../../core/utils/app_sizes.dart';

class SettingsMarketItem extends StatelessWidget {
  SettingsMarketItem({Key? key, required this.text, required this.onTap})
      : super(key: key);

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.getProportionateScreenHeight(10),
          horizontal: AppSizes.getProportionateScreenWidth(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: AppColors.fontColor,
                fontSize: 16.sp,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.GrayColor161,
            ),
          ],
        ),
      ),
    );
  }
}
