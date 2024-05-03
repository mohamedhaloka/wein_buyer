import 'package:flutter/material.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/provider/bottom_nav_provider/presentation/screens/bottom_nav_provider_screen.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../widgets/custom_button.dart';
import '../../../../../../widgets/space_width.dart';
import '../../../../../core/utils/app_strings.dart';
import 'done_return_order_bottom_sheet.dart';

class AcceptOrRejectReturnOrderBTN extends StatelessWidget {
  const AcceptOrRejectReturnOrderBTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: AppSizes.getProportionateScreenWidth(120),
          height: AppSizes.getProportionateScreenHeight(50),
          child: CustomButton(
            text: AppStrings.confirm.translate(),
            onPress: () {
              MagicRouter.pop();
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                builder: (BuildContext context) {
                  return DoneReturnOrderBottomSheet();
                },
              );
            },
          ),
        ),
        SpaceW(inputWidth: 10),
        SizedBox(
          width: AppSizes.getProportionateScreenWidth(120),
          height: AppSizes.getProportionateScreenHeight(50),
          child: CustomButton(
            text: AppStrings.regretOrRejectCommingOrderBTN.translate(),
            fontColor: AppColors.primaryColor,
            buttonColor: AppColors.primaryColor.withOpacity(0.1),
            onPress: () {
              MagicRouter.navigateAndPopAll(BottomNavProviderScreen(selectedIndex: 0));
            },
          ),
        ),
      ],
    );
  }
}
