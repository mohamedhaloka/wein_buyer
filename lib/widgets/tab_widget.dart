import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_sizes.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.getProportionateScreenWidth(6),
      height: AppSizes.getProportionateScreenHeight(50),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
    );
  }
}
