import 'package:flutter/material.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/widgets/custom_button_with_icon.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';

class MoreForProductItem extends StatelessWidget {
  const MoreForProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.screenHeight * 0.33,
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
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.01),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              padding: EdgeInsets.all(
                AppSizes.getProportionateScreenWidth(20),
              ),
              child: Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
            SpaceH(inputHeigth: 25),
            CustomButtonWithIcon(
              icon: Icons.edit_outlined,
              colorIcon: Colors.black,
              text: AppStrings.edit.translate(),
              fontColor: Colors.black,
              buttonColor: Colors.white,
              onPress: () {},
            ),
            SpaceH(inputHeigth: 10),
            CustomButtonWithIcon(
              icon: Icons.delete_forever_outlined,
              colorIcon: Colors.red,
              text: AppStrings.deleteAcceptOrRejectOngoingOrderBTN.translate(),
              fontColor: Colors.red,
              buttonColor: Colors.white,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
