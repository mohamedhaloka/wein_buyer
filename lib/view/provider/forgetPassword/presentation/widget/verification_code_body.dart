import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/view/provider/forgetPassword/presentation/controller/forget_password_cubit.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../widgets/custom_button.dart';
import '../../../../../../widgets/space_height.dart';
import '../../../../../core/router/router.dart';
import '../../../../../core/utils/app_strings.dart';

class VerificationCodeBody extends StatelessWidget {
  const VerificationCodeBody({Key? key}) : super(key: key);

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.confirmVerificationCodeBody.translate(),
                      style: TextStyle(
                        color: AppColors.fontColor,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SpaceH(inputHeigth: 15),
                    Text(
                      AppStrings.emailConfirmVerificationCodeBody.translate(),
                      style: TextStyle(
                        color: AppColors.GrayColor112,
                        fontSize: 14.sp,
                      ),
                    ),
                    SpaceH(inputHeigth: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          color: AppColors.primaryColor,
                        ),
                        Text(
                          ForgetPasswordCubit.of(context).emailController.text,
                          style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SpaceH(inputHeigth: 20),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Form(
                        key:
                            ForgetPasswordCubit.of(context).formKeyVerificationCode,
                        child: PinCodeTextField(
                          appContext: context,
                          length: 4,
                          keyboardType: TextInputType.number,
                          controller:
                              ForgetPasswordCubit.of(context).pinCodeController,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.circle,
                            fieldHeight: 70,
                            fieldWidth: 70,
                            activeFillColor: Colors.white,
                            activeColor: AppColors.primaryColor,
                            selectedColor: AppColors.primaryColor,
                            inactiveColor: AppColors.GrayColor239,
                          ),
                          onChanged: (String value) {},
                          onCompleted: (v) => ForgetPasswordCubit.of(context)
                              .verificationCode(context),
                        ),
                      ),
                    ),
                    SpaceH(inputHeigth: 20),
                    BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                      builder: (context, state) {
                        return state is VerificationCodeLoading
                            ? const LoadingIndicator()
                            : CustomButton(
                                text: AppStrings.confirm.translate(),
                                paddingVertical: 15,
                                onPress: () => ForgetPasswordCubit.of(context)
                                    .verificationCode(context),
                              );
                      },
                    ),
                  ],
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
