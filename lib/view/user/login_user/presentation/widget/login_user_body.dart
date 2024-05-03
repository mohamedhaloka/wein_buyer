import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/view/user/bottom_nav_user/presentation/screens/bottom_nav_user_screen.dart';
import 'package:wein_buyer/view/user/forgetPasswordUser/presentation/screen/forget_password_screen.dart';
import 'package:wein_buyer/view/user/login_user/presentation/controller/login_cubit.dart';
import 'package:wein_buyer/view/user/register_user/presentation/screen/register_screen.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../core/validator/validator.dart';
import '../../../../../../../widgets/custom_button.dart';
import '../../../../../../../widgets/input_form_field.dart';
import '../../../../../../../widgets/loading_indicator.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../core/appStorage/app_storage.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../provider/account/presentation/screen/contact_us_screen.dart';

class LoginUserBody extends StatelessWidget {
  const LoginUserBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: AppSizes.screenHeight * 0.5,
                child: Stack(
                  children: [
                    Container(
                      width: AppSizes.screenWidth,
                      height: AppSizes.screenHeight * 0.5,
                      color: AppColors.primaryColor,
                      child: Image.asset(
                        AppAssets.logo,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: AppSizes.screenHeight * 0.03,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: AppSizes.getProportionateScreenHeight(50),
                right: AppSizes.getProportionateScreenWidth(10),
                child: TextButton(
                  child: Text(
                    AppStrings.skip.translate(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  onPressed: () {
                    print("getUserInfo =======> ${AppStorage.getUserInfo}");
                    print("getUserProviderInfo =======> ${AppStorage.getUserProviderInfo}");
                    MagicRouter.navigateAndPopAll(
                        BottomNavUserScreen(selectedIndex: 0));
                  },
                ),
              ),
            ],
          ),
          Container(
            width: AppSizes.screenWidth,
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getProportionateScreenWidth(10),
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Form(
              key: LoginUserCubit.of(context).formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.loginProviderBody.translate(),
                    style: TextStyle(
                      color: AppColors.fontColor,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SpaceH(inputHeigth: 10),
                  InputFormField(
                    hint: AppStrings.phone.translate(),
                    icon: Icons.phone_android,
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    validator: Validator.phoneNumber,
                    isNumber: true,
                    controller: LoginUserCubit.of(context).phoneController,
                  ),
                  InputFormField(
                    hint: AppStrings.passwordLoginProviderBody.translate(),
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    validator: Validator.password,
                    secure: true,
                    controller: LoginUserCubit.of(context).passwordController,
                  ),
                  TextButton(
                    child: Text(
                      AppStrings.forgetPasswordBody.translate(),
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    onPressed: () {
                      MagicRouter.navigateTo(const ForgetPasswordScreen());
                    },
                  ),
                  BlocBuilder<LoginUserCubit, LoginUserState>(
                    builder: (context, state) {
                      return state is LoginLoading
                          ? const LoadingIndicator()
                          : CustomButton(
                              text: AppStrings.login.translate(),
                              paddingVertical: 15,
                              onPress: () =>
                                  LoginUserCubit.of(context).login(context),
                            );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.noLogin.translate()),
                      TextButton(
                        child: Text(
                          AppStrings.newAccount.translate(),
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {
                          MagicRouter.navigateTo(const RegisterScreen());
                        },
                      ),
                    ],
                  ),
                  Center(
                    child: TextButton(
                      child: Text(
                        AppStrings.contactUsTitle.translate(),
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {
                        MagicRouter.navigateTo(const ContactUsScreen());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
