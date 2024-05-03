import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';

import '../../../../../core/router/router.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/loading_indicator.dart';
import '../../../../user/login_user/presentation/screen/login_user_screen.dart';
import '../../../../user/pages/view/termsAndConditions/presentation/screen/terms_and_conditions_screen.dart';
import '../../../login_provider/presentation/screen/login_provider_screen.dart';
import '../controller/register_cubit.dart';

class RegisterAction extends StatelessWidget {
  const RegisterAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          child: Row(
            children: [
              Text(
                AppStrings.okRegisterBody.translate(),
                style: const TextStyle(
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                AppStrings.registerRegisterBody.translate(),
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          onPressed: () {
            MagicRouter.navigateTo(
                const TermsAndConditionsScreen());
          },
        ),
        BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return state is RegisterLoading
                ? const LoadingIndicator()
                : CustomButton(
              text:
              AppStrings.createAccount.translate(),
              paddingVertical: 15,
              onPress:
              RegisterCubit.of(context).register,
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                AppStrings.haveLoginRegisterBody.translate()),
            TextButton(
              onPressed: () {
                MagicRouter.navigateAndPopAll(
                    const LoginProviderScreen());
              },
              child: Text(
                AppStrings.loginRegisterBody.translate(),
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.buyerLogin.translate(),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            onPressed: () {
              MagicRouter.navigateAndPopUntilFirstPage(
                  const LoginUserScreen());
            },
          ),
        ),
      ],
    );
  }
}
