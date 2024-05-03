import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import 'package:wein_buyer/widgets/input_form_field.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';

void addSizeGuideBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    builder: (BuildContext context) {
      return Container(
        height: AppSizes.screenHeight * 0.35,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.getProportionateScreenHeight(10),
          horizontal: AppSizes.getProportionateScreenWidth(15),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SpaceH(inputHeigth: 5),
              Text(
                AppStrings.addGuide.translate(),
                style: TextStyle(
                  color: AppColors.fontColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpaceH(inputHeigth: 20),
               InputFormField(
                hint: AppStrings.nameGuide.translate(),
                textColor: AppColors.fontColor,
              ),
              SpaceH(inputHeigth: 10),
              Container(
                width: AppSizes.screenWidth,
                height: AppSizes.getProportionateScreenHeight(50),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.getProportionateScreenWidth(10),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFEFEF),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text(
                      AppStrings.addImageForGuide.translate(),
                      style: const TextStyle(
                        color: AppColors.fontColor,
                        fontSize: 14,
                      ),
                    ),
                    const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              SpaceH(inputHeigth: 15),
              CustomButton(
                text: AppStrings.add.translate(),
                radius: 10,
                onPress: () {},
              ),
            ],
          ),
        ),
      );
    },
  );
}
