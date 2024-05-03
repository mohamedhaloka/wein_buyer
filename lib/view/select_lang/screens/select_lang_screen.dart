import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/view/select_user/presentation/screens/select_user_screen.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import '../../../core/appStorage/app_storage.dart';
import '../../../core/blocks/lang_cubit/lang_cubit.dart';
import '../../../core/router/router.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/app_strings.dart';
import '../../../widgets/space_height.dart';

class SelectLangScreen extends StatelessWidget {
  const SelectLangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     AppStrings.selectLang.translate(),
      //     style: const TextStyle(
      //       color: AppColors.primaryColor,
      //     ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              AppAssets.full_logo,
              width: AppSizes.screenWidth,
            ),
            SpaceH(inputHeigth: 50),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.getProportionateScreenWidth(10),
                vertical: AppSizes.getProportionateScreenHeight(50),
              ),
              child: BlocBuilder<LangCubit, LangState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<LangCubit>().onUpdateLanguage('ar');
                          AppStorage.cacheLang('ar');
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
                            border: state.locale.languageCode == 'ar'
                                ? Border.all(
                                    color: AppColors.primaryColor,
                                    width: 2,
                                  )
                                : null,
                          ),
                          child: Text(
                            'العربية',
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
                        onTap: () {
                          context.read<LangCubit>().onUpdateLanguage('en');
                          AppStorage.cacheLang('en');

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
                            border: state.locale.languageCode == 'en'
                                ? Border.all(
                                    color: AppColors.primaryColor,
                                    width: 2,
                                  )
                                : null,
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
                      SpaceH(inputHeigth: 30),
                      CustomButton(
                        text: 'اختر',
                        onPress: () {
                          // AppStorage.cacheLang(context
                          //     .read<LangCubit>()
                          //     .state
                          //     .locale
                          //     .languageCode);
                          MagicRouter.navigateTo(const SelectUserScreen());
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
