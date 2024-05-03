import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_sizes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text = '',
    this.fontSize = 14,
    this.fontColor = Colors.white,
    required this.onPress,
    this.radius = 15,
    this.paddingVertical = 10,
    this.paddinghorizontal = 20,
    this.buttonColor = AppColors.primaryColor,
    this.borderColor = Colors.white,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color fontColor;
  final VoidCallback onPress;
  final double radius;
  final double paddingVertical;
  final double paddinghorizontal;
  final Color buttonColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(paddinghorizontal),
            vertical: paddingVertical),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize.sp,
              color: fontColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
