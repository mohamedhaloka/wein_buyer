import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/view/provider/login_provider/presentation/screen/login_provider_screen.dart';
import 'package:wein_buyer/view/user/login_user/presentation/screen/login_user_screen.dart';
import 'package:wein_buyer/view/user/pages/view/termsAndConditions/presentation/screen/terms_and_conditions_screen.dart';
import 'package:wein_buyer/view/user/register_user/presentation/controller/register_cubit.dart';
import 'package:wein_buyer/widgets/space_width.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../core/validator/validator.dart';
import '../../../../../../../widgets/custom_button.dart';
import '../../../../../../../widgets/input_form_field.dart';
import '../../../../../../../widgets/loading_indicator.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../bottom_nav_user/presentation/screens/bottom_nav_user_screen.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: RegisterUserCubit.of(context).formKey,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: AppSizes.screenHeight * 0.35,
                  child: Stack(
                    children: [
                      Container(
                        height: AppSizes.screenHeight * 0.35,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.createAccount.translate(),
                    style: TextStyle(
                      color: AppColors.fontColor,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SpaceH(inputHeigth: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InputFormField(
                          hint: AppStrings.firstName.translate(),
                          icon: Icons.person,
                          fillColor: Colors.white,
                          textColor: AppColors.fontColor,
                          validator: Validator.generalField,
                          controller:
                              RegisterUserCubit.of(context).firstNameController,
                        ),
                      ),
                      SpaceW(inputWidth: 10),
                      Expanded(
                        flex: 1,
                        child: InputFormField(
                          hint: AppStrings.secondName.translate(),
                          icon: Icons.person,
                          fillColor: Colors.white,
                          textColor: AppColors.fontColor,
                          validator: Validator.generalField,
                          controller:
                              RegisterUserCubit.of(context).lastNameController,
                        ),
                      ),
                    ],
                  ),
                  InputFormField(
                    hint: AppStrings.email.translate(),
                    icon: Icons.email,
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    validator: Validator.email,
                    controller: RegisterUserCubit.of(context).emailController,
                  ),
                  InputFormField(
                    hint: AppStrings.phone.translate(),
                    icon: Icons.phone_android,
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    isNumber: true,
                    validator: Validator.phoneNumber,
                    controller: RegisterUserCubit.of(context).phoneController,
                  ),
                  InputFormField(
                    hint: AppStrings.passwordLoginProviderBody.translate(),
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    validator: Validator.password,
                    secure: true,
                    controller:
                        RegisterUserCubit.of(context).passwordController,
                  ),
                  InputFormField(
                    hint: AppStrings.confirmPassword.translate(),
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    validator: (value) => Validator.confirmPassword(value,
                        RegisterUserCubit.of(context).passwordController.text),
                    secure: true,
                    controller:
                        RegisterUserCubit.of(context).confirmPasswordController,
                  ),
                  TextButton(
                    child: Row(
                      children: [
                        Text(
                          AppStrings.confirmTermsAndConditions.translate(),
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Text(
                          AppStrings.termsAndConditionsScreen.translate(),
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      MagicRouter.navigateTo(const TermsAndConditionsScreen());
                    },
                  ),
                  BlocBuilder<RegisterUserCubit, RegisterUserState>(
                    builder: (context, state) {
                      return state is RegisterLoading
                          ? const LoadingIndicator()
                          : CustomButton(
                              text: AppStrings.createAccount.translate(),
                              paddingVertical: 15,
                              onPress: RegisterUserCubit.of(context).register,
                            );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.noLogin.translate()),
                      TextButton(
                        child: Text(
                          AppStrings.login.translate(),
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {
                          MagicRouter.navigateAndPopAll(
                              const LoginUserScreen());
                        },
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          AppStrings.silerLogin.translate(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      onPressed: () {
                        MagicRouter.navigateAndPopUntilFirstPage(
                            const LoginProviderScreen());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
