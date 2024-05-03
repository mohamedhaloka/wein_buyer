import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/blocks/lang_cubit/lang_cubit.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/splash/presentation/screens/splash_screen.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../core/appStorage/app_storage.dart';
import '../../../../../core/utils/app_strings.dart';

class BottomSheetChangeLanguageWidget extends StatefulWidget {
  const BottomSheetChangeLanguageWidget({Key? key}) : super(key: key);

  @override
  State<BottomSheetChangeLanguageWidget> createState() =>
      _BottomSheetChangeLanguageWidgetState();
}

class _BottomSheetChangeLanguageWidgetState
    extends State<BottomSheetChangeLanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.screenHeight * 0.35,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              MagicRouter.pop();
            },
            child: Image.asset(AppAssets.exit_icon),
          ),
          SpaceH(inputHeigth: 15),
          Expanded(
            child: Container(
              width: AppSizes.screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.getProportionateScreenWidth(25),
                vertical: AppSizes.getProportionateScreenHeight(20),
              ),
              child: Column(
                children: [
                  Text(
                    AppStrings.language.translate(),
                    style: TextStyle(
                      color: AppColors.fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  SpaceH(inputHeigth: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
                          context.read<LangCubit>().onUpdateLanguage('ar');
                          await AppStorage.cacheLang('ar');
                          MagicRouter.navigateAndPopAll(const SplashScreen());
                        },
                        child: Container(
                          width: AppSizes.screenWidth,
                          padding: EdgeInsets.symmetric(
                            vertical: AppSizes.getProportionateScreenHeight(10),
                            horizontal: AppSizes.getProportionateScreenWidth(10),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: context.read<LangCubit>().state.locale.languageCode == 'ar' ? Border.all(
                              color: AppColors.primaryColor,
                              width: 2,
                            ) : null,
                          ),
                          child: Text(
                            AppStrings.arabic.translate(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.fontColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SpaceH(inputHeigth: 5),
                      const Divider(),
                      SpaceH(inputHeigth: 5),
                      InkWell(
                        onTap: () async{
                          context.read<LangCubit>().onUpdateLanguage('en');
                          await AppStorage.cacheLang('en');
                          MagicRouter.navigateAndPopAll(const SplashScreen());
                        },
                        child: Container(
                          width: AppSizes.screenWidth,
                          padding: EdgeInsets.symmetric(
                            vertical: AppSizes.getProportionateScreenHeight(10),
                            horizontal: AppSizes.getProportionateScreenWidth(10),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: context.read<LangCubit>().state.locale.languageCode == 'en' ?  Border.all(
                              color: AppColors.primaryColor,
                              width: 2,
                            ) : null,
                          ),
                          child: Text(
                            'English',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.fontColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
