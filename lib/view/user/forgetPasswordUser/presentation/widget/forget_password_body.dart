import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/view/user/forgetPasswordUser/presentation/controller/forget_password_cubit.dart';
import 'package:wein_buyer/view/user/forgetPasswordUser/presentation/screen/verification_code_screen.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../core/validator/validator.dart';
import '../../../../../../../widgets/custom_button.dart';
import '../../../../../../../widgets/input_form_field.dart';
import '../../../../../../../widgets/loading_indicator.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../core/utils/app_strings.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Form(
            key: ForgetPasswordUserCubit.of(context).formKeyForgetPassword,
            child: Column(
              children: [
                SizedBox(
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
                        AppStrings.forgetPasswordBody.translate(),
                        style: TextStyle(
                          color: AppColors.fontColor,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SpaceH(inputHeigth: 15),
                      Text(
                        AppStrings.enterEmailForgetPasswordBody.translate(),
                        style: TextStyle(
                          color: AppColors.GrayColor112,
                          fontSize: 14.sp,
                        ),
                      ),
                      SpaceH(inputHeigth: 30),
                      InputFormField(
                        hint: AppStrings.emailForgetPasswordBody.translate(),
                        icon: Icons.email,
                        fillColor: Colors.white,
                        textColor: AppColors.fontColor,
                        validator: Validator.email,
                        controller:
                            ForgetPasswordUserCubit.of(context).phoneController,
                      ),
                      SpaceH(inputHeigth: 20),
                      BlocBuilder<ForgetPasswordUserCubit,
                          ForgetPasswordUserState>(
                        builder: (context, state) {
                          return state is ForgetPasswordLoading
                              ? const LoadingIndicator()
                              : CustomButton(
                                  text: AppStrings.send.translate(),
                                  paddingVertical: 15,
                                  onPress: () =>
                                      ForgetPasswordUserCubit.of(context)
                                          .forgetPassword(context),
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
