import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/core/validator/validator.dart';
import 'package:wein_buyer/view/provider/account/presentation/screen/contact_us_screen.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import 'package:wein_buyer/widgets/input_form_field.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../widgets/loading_indicator.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../forgetPassword/presentation/screen/forget_password_screen.dart';
import '../../../register_provider/presentation/screen/register_screen.dart';
import '../controller/login_cubit.dart';

class LoginProviderBody extends StatelessWidget {
  const LoginProviderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: AppSizes.screenHeight * 0.5,
            child: Stack(
              children: [
                Container(
                  height: AppSizes.screenHeight * 0.5,
                  width: AppSizes.screenWidth,
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
              key: LoginCubit.of(context).formKey,
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
                    hint: AppStrings.emailLoginProviderBody.translate(),
                    icon: Icons.email_outlined,
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    validator: Validator.email,
                    controller: LoginCubit.of(context).emailController,
                  ),
                  InputFormField(
                    hint: AppStrings.passwordLoginProviderBody.translate(),
                    icon: Icons.lock_open,
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    validator: Validator.password,
                    controller: LoginCubit.of(context).passwordController,
                    secure: true,
                  ),
                  TextButton(
                    child: Text(
                      AppStrings.forgetPasswordLoginProviderBody.translate(),
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    onPressed: () {
                      MagicRouter.navigateTo(const ForgetPasswordScreen());
                    },
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return state is LoginLoading
                          ? const LoadingIndicator()
                          : CustomButton(
                              text:
                                  AppStrings.enterLoginProviderBody.translate(),
                              paddingVertical: 15,
                              onPress: () =>
                                  LoginCubit.of(context).login(context),
                            );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.notLoginProviderBody.translate()),
                      TextButton(
                        child: Text(
                          AppStrings.newLoginProviderBody.translate(),
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
