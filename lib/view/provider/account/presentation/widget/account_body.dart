import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/view/provider/account/presentation/controller/account_cubit.dart';
import 'package:wein_buyer/view/provider/account/presentation/screen/contact_us_screen.dart';
import 'package:wein_buyer/view/provider/account/presentation/widget/total_orders_account_widget.dart';
import 'package:wein_buyer/view/user/myAccount/presentation/widget/bottom_sheet_change_language_widget.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';
import 'account_data_widget.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TotalOrdersAccountWidget(),
          SpaceH(inputHeigth: 15),
          const AccountDataWidget(),
          SpaceH(inputHeigth: 35),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getProportionateScreenWidth(20),
            ),
            child: Column(
              children: [
                CustomButton(
                  text: AppStrings.changeLang.translate(),
                  radius: 10,
                  fontColor: AppColors.primaryColor,
                  buttonColor: Colors.white,
                  borderColor: AppColors.primaryColor,
                  paddingVertical: 15,
                  onPress: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return const BottomSheetChangeLanguageWidget();
                      },
                    );
                  },
                ),
                SpaceH(inputHeigth: 10),
                CustomButton(
                  text: AppStrings.logout.translate(),
                  radius: 10,
                  fontColor: AppColors.primaryColor,
                  buttonColor: Colors.white,
                  borderColor: AppColors.primaryColor,
                  paddingVertical: 15,
                  onPress: () {
                    AppStorage.signOut();
                  },
                ),
                SpaceH(inputHeigth: 10),
                // CustomButton(
                //   text: 'ارسال طلب تعديل',
                //   radius: 10,
                //   fontColor: AppColors.primaryColor,
                //   buttonColor: AppColors.primaryColor.withOpacity(0.1),
                //   paddingVertical: 15,
                //   onPress: () {},
                // ),
                // SpaceH(inputHeigth: 10),
                CustomButton(
                  text: AppStrings.contactUsTitle.translate(),
                  radius: 10,
                  buttonColor: AppColors.primaryColor,
                  paddingVertical: 15,
                  onPress: () {
                    MagicRouter.navigateTo(const ContactUsScreen());
                  },
                ),
                SpaceH(inputHeigth: 10),
                CustomButton(
                  text: AppStrings.deleteAccount.translate(),
                  paddingVertical: AppSizes.getProportionateScreenHeight(17),
                  buttonColor: Colors.white,
                  borderColor: AppColors.primaryColor,
                  fontColor: AppColors.primaryColor,
                  onPress: () => AccountCubit.of(context).showAlertDialog(
                    context: context,
                    title: 'حذف الحساب',
                    contentMessage: 'هل تريد حقًا حذف الحساب؟',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
