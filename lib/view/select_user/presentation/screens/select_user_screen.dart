import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/provider/login_provider/presentation/screen/login_provider_screen.dart';
import 'package:wein_buyer/view/user/login_user/presentation/screen/login_user_screen.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../core/utils/app_strings.dart';
import '../controller/select_user_cubit.dart';

class SelectUserScreen extends StatelessWidget {
  const SelectUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectUserCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(AppStrings.selectUserTitle.translate()),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(10),
            vertical: AppSizes.getProportionateScreenHeight(50),
          ),
          child: BlocBuilder<SelectUserCubit, SelectUserState>(
            buildWhen: (previous, current) =>
                previous != current || current is SelectedTypeUserState,
            builder: (context, state) {
              int index = SelectUserCubit.of(context).index;
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      SelectUserCubit.of(context).selectedTypeUser(0);
                    },
                    child: Container(
                      width: AppSizes.getProportionateScreenHeight(200),
                      height: AppSizes.getProportionateScreenHeight(200),
                      decoration: BoxDecoration(
                        color:
                            index == 0 ? AppColors.primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: index == 0
                              ? Colors.white
                              : AppColors.primaryColor,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            AppAssets.provider,
                            color: index == 0
                                ? Colors.white
                                : AppColors.primaryColor,
                            height: AppSizes.getProportionateScreenHeight(80),
                          ),
                          Text(
                            AppStrings.selectUserProvider.translate(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: index == 0
                                  ? Colors.white
                                  : AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SpaceH(inputHeigth: 30),
                  InkWell(
                    onTap: () {
                      SelectUserCubit.of(context).selectedTypeUser(1);
                    },
                    child: Container(
                      width: AppSizes.getProportionateScreenHeight(200),
                      height: AppSizes.getProportionateScreenHeight(200),
                      decoration: BoxDecoration(
                        color:
                            index == 1 ? AppColors.primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: index == 1
                              ? Colors.white
                              : AppColors.primaryColor,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            AppAssets.user,
                            color: index == 1
                                ? Colors.white
                                : AppColors.primaryColor,
                            height: AppSizes.getProportionateScreenHeight(80),
                          ),
                          Text(
                            AppStrings.selectUserUser.translate(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: index == 1
                                  ? Colors.white
                                  : AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SpaceH(inputHeigth: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.getProportionateScreenWidth(20)),
                    child: CustomButton(
                      text: AppStrings.selectUserBTN.translate(),
                      paddingVertical:
                          AppSizes.getProportionateScreenHeight(20),
                      radius: 10,
                      onPress: () {
                        if (index == 0) {
                          //provider
                          MagicRouter.navigateTo(const LoginProviderScreen());
                        } else if (index == 1) {
                          // user
                          MagicRouter.navigateTo(const LoginUserScreen());
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
