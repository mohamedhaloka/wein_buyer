import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/provider/forgetPassword/presentation/controller/forget_password_cubit.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../core/validator/validator.dart';
import '../../../../../../widgets/custom_button.dart';
import '../../../../../../widgets/input_form_field.dart';
import '../../../../../../widgets/space_height.dart';
import '../../../../../core/router/router.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: AppSizes.screenHeight * 0.6,
                child: Stack(
                  children: [
                    Container(
                      height: AppSizes.screenHeight * 0.6,
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
                  key: ForgetPasswordCubit.of(context).formKeyForgetPassword,
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
                        controller: ForgetPasswordCubit.of(context).emailController,
                      ),
                      SpaceH(inputHeigth: 20),
                      BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                        builder: (context, state) {
                          return state is ForgetPasswordLoading
                              ? const LoadingIndicator()
                              : CustomButton(
                                  text: AppStrings.sendForgetPasswordBody.translate(),
                                  paddingVertical: 15,
                                  onPress: () => ForgetPasswordCubit.of(context)
                                      .forgetPassword(context),
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
