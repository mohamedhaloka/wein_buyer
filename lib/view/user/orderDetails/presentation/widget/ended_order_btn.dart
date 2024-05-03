import 'package:flutter/material.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';

import '../../../../../../../core/models/orders_model.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/custom_button.dart';
import '../../../../../core/utils/app_strings.dart';

class EndedOrderBTN extends StatelessWidget {
  const EndedOrderBTN({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppSizes.screenWidth * 0.8,
        height: AppSizes.getProportionateScreenHeight(50),
        child: CustomButton(
          text: AppStrings.endedOrderBTN.translate(),
          fontColor: AppColors.primaryColor,
          buttonColor: AppColors.primaryColor.withOpacity(0.2),
          onPress: () {},
        ),
      ),
    );
  }
}
