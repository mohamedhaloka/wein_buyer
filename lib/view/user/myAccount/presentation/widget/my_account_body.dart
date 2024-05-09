import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/user/addresses/presentation/screen/addresses_screen.dart';
import 'package:wein_buyer/view/user/editProfileUser/presentation/screen/edit_profile_screen.dart';
import 'package:wein_buyer/view/user/favorites/presentation/screen/favorites_screen.dart';
import 'package:wein_buyer/view/user/myAccount/presentation/widget/bottom_sheet_change_language_widget.dart';
import 'package:wein_buyer/view/user/pages/view/fqs/presentation/screen/fqs_screen.dart';
import 'package:wein_buyer/widgets/space_width.dart';

import '../../../../../../../widgets/my_painter.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../provider/account/presentation/screen/contact_us_screen.dart';
import '../../../editProfileUser/presentation/controller/edit_profile_cubit.dart';
import '../../../pages/view/currencies/presentation/screen/currencies_screen.dart';
import '../../../pages/view/privacyPolicy/presentation/screen/privacy_policy_screen.dart';
import '../../../pages/view/termsAndConditions/presentation/screen/terms_and_conditions_screen.dart';
import '../../data/model/account_item_model.dart';

class MyAccountBody extends StatelessWidget {
  MyAccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AccountItemModel> listOfAccountItemModel = [
      AccountItemModel(Icons.favorite, AppStrings.favourite.translate()),
      AccountItemModel(Icons.language, AppStrings.changeCurrency.translate()),
      AccountItemModel(Icons.location_on, AppStrings.myAddresses.translate()),
      // AccountItemModel(Icons.replay, AppStrings.myReturns.translate()),
      AccountItemModel(Icons.language, AppStrings.lang.translate()),
      AccountItemModel(Icons.lock, AppStrings.privacy.translate()),
      AccountItemModel(
          Icons.message, AppStrings.termsAndConditionsScreen.translate()),
      AccountItemModel(Icons.question_answer, AppStrings.fqs.translate()),
      AccountItemModel(Icons.mail, AppStrings.connectWithUsScreen.translate()),
      AccountItemModel(Icons.share, AppStrings.share.translate()),
      AccountItemModel(Icons.logout, AppStrings.logout.translate()),
    ];

    return Column(
      children: [
        Stack(
          children: [
            RotatedBox(
              quarterTurns: 2,
              child: ClipPath(
                clipper: CustomClip(),
                child: Container(
                  width: AppSizes.screenWidth,
                  height: AppSizes.screenHeight * 0.27,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            PositionedDirectional(
              top: AppSizes.getProportionateScreenHeight(40),
              start: AppSizes.getProportionateScreenWidth(10),
              child: Row(
                children: [
                  Container(
                    height: AppSizes.screenHeight * 0.28,
                    width: AppSizes.screenWidth * 0.28,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(AppAssets.person_icon),
                  ),
                  SpaceW(inputWidth: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<EditProfileCubit, EditProfileState>(
                        builder: (context, state) {
                          return state is GetProfileLoaded
                              ? Text(
                                  "${EditProfileCubit.of(context).profileModel!.body!.firstName} ${EditProfileCubit.of(context).profileModel!.body!.lastName}",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.transparntColor255,
                                  ),
                                )
                              : Text(
                                  "",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.transparntColor255,
                                  ),
                                );
                        },
                      ),
                      SpaceH(inputHeigth: 10),
                      InkWell(
                        onTap: () {
                          MagicRouter.navigateTo(const EditProfileScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                AppStrings.editProfile.translate(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.transparntColor255,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: AppColors.transparntColor255,
                                size: 18.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(
            itemCount: listOfAccountItemModel.length,
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getProportionateScreenWidth(25),
            ),
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  switch (index) {
                    case 0:
                      MagicRouter.navigateTo(const FavoritesScreen());
                      return;
                    case 1:
                      MagicRouter.navigateTo(const CurrenciesScreen());
                      return;
                    case 2:
                      MagicRouter.navigateTo(const AddressesScreen());
                      return;
                    case 3:
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
                      return;
                    case 4:
                      MagicRouter.navigateTo(const PrivacyPolicyScreen());
                      return;
                    case 5:
                      MagicRouter.navigateTo(const TermsAndConditionsScreen());
                      return;
                    case 6:
                      MagicRouter.navigateTo(const FqsScreen());
                      return;
                    case 7:
                      MagicRouter.navigateTo(const ContactUsScreen());
                      return;
                    case 8:
                      if (Platform.isIOS) {
                        Share.share(
                            'https://apps.apple.com/us/app/ezygo/id1672873142');
                      } else {
                        Share.share(
                            'https://play.google.com/store/apps/details?id=com.user.hMart');
                      }
                      return;
                    case 9:
                      AppStorage.signOut();
                      return;
                  }
                  // index == 0
                  //     ? MagicRouter.navigateTo(const FavoritesScreen())
                  //     : index == 1
                  //         ? MagicRouter.navigateTo(const AddressesScreen())
                  //         : index == 2
                  //             ? showModalBottomSheet<void>(
                  //                 context: context,
                  //                 isScrollControlled: true,
                  //                 backgroundColor: Colors.transparent,
                  //                 shape: const RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.vertical(
                  //                     top: Radius.circular(25),
                  //                   ),
                  //                 ),
                  //                 builder: (BuildContext context) {
                  //                   return const BottomSheetChangeLanguageWidget();
                  //                 },
                  //               )
                  //             : index == 3
                  //                 ? MagicRouter.navigateTo(
                  //                     const PrivacyPolicyScreen())
                  //                 : index == 4
                  //                     ? MagicRouter.navigateTo(
                  //                         const TermsAndConditionsScreen())
                  //                     : index == 5
                  //                         ? MagicRouter.navigateTo(
                  //                             const FqsScreen())
                  //                         : index == 6
                  //                             ? MagicRouter.navigateTo(
                  //                                 const ContactUsScreen())
                  //                             : index == 7
                  //                                 ? Share.share('')
                  //                                 : index == 8
                  //                                     ? AppStorage.signOut()
                  //                                     : null;
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                        vertical: AppSizes.getProportionateScreenHeight(6),
                      ) +
                      (index == listOfAccountItemModel.length - 1
                          ? const EdgeInsets.only(top: 25)
                          : EdgeInsets.zero),
                  child: Row(
                    children: [
                      Icon(
                        listOfAccountItemModel[index].icon,
                        color: index == listOfAccountItemModel.length - 1
                            ? AppColors.primaryColor
                            : const Color.fromRGBO(214, 201, 201, 1),
                        size: 18.sp,
                      ),
                      SpaceW(inputWidth: 10),
                      Text(
                        listOfAccountItemModel[index].text,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: index == listOfAccountItemModel.length - 1
                              ? AppColors.primaryColor
                              : AppColors.fontColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
