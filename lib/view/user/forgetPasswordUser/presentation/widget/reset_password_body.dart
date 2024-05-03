import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/view/user/login_user/presentation/screen/login_user_screen.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../core/validator/validator.dart';
import '../../../../../../../widgets/custom_button.dart';
import '../../../../../../../widgets/input_form_field.dart';
import '../../../../../../../widgets/loading_indicator.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../core/utils/app_strings.dart';
import '../controller/forget_password_cubit.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Form(
            key: ForgetPasswordUserCubit.of(context).formKeyChangePassword,
            child: Column(
              children: [
                Container(
                  height: AppSizes.screenHeight * 0.6,
                  child: Stack(
                    children: [
                      Container(
                        width: AppSizes.screenWidth,
                        height: AppSizes.screenHeight * 0.6,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.changePasswordBody.translate(),
                        style: TextStyle(
                          color: AppColors.fontColor,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SpaceH(inputHeigth: 15),
                      Text(
                        AppStrings.pleaseChangePasswordBody.translate(),
                        style: TextStyle(
                          color: AppColors.GrayColor112,
                          fontSize: 14.sp,
                        ),
                      ),
                      SpaceH(inputHeigth: 30),
                      InputFormField(
                        hint: AppStrings.newPassword.translate(),
                        icon: Icons.lock_outline_sharp,
                        fillColor: Colors.white,
                        textColor: AppColors.fontColor,
                        validator: Validator.password,
                        secure: true,
                        controller:
                            ForgetPasswordUserCubit.of(context).passwordController,
                      ),
                      InputFormField(
                        hint: AppStrings.confirmPassword.translate(),
                        icon: Icons.lock_outline_sharp,
                        fillColor: Colors.white,
                        textColor: AppColors.fontColor,
                        validator: (value) => Validator.confirmPassword(
                            value,
                            ForgetPasswordUserCubit.of(context)
                                .passwordController
                                .text),
                        secure: true,
                        controller: ForgetPasswordUserCubit.of(context)
                            .passwordConfirmController,
                      ),
                      SpaceH(inputHeigth: 20),
                      BlocBuilder<ForgetPasswordUserCubit, ForgetPasswordUserState>(
                        builder: (context, state) {
                          return state is ChangePasswordLoading
                              ? const LoadingIndicator()
                              : CustomButton(
                                  text: AppStrings.confirm.translate(),
                                  paddingVertical: 15,
                                  onPress: () => ForgetPasswordUserCubit.of(context)
                                      .changePassword(),
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          top: 30.h,
          start: 20.w,
          child: InkWell(
            onTap: ()=> MagicRouter.pop(),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.primaryColor,
                size: 20.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
