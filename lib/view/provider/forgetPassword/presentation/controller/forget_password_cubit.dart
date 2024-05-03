import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/view/provider/forgetPassword/domain/usecases/change_password.dart';
import 'package:wein_buyer/view/provider/forgetPassword/domain/usecases/forget_password.dart';
import 'package:wein_buyer/view/provider/forgetPassword/domain/usecases/verification_code.dart';
import 'package:wein_buyer/view/provider/forgetPassword/presentation/screen/change_password_screen.dart';
import 'package:wein_buyer/view/provider/forgetPassword/presentation/screen/verification_code_screen.dart';
import 'package:wein_buyer/view/provider/login_provider/presentation/screen/login_provider_screen.dart';

import '../../../../../../widgets/snackBar.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordUseCase, this.verificationCodeUseCase,
      this.changePasswordUseCase)
      : super(ForgetPasswordInitial());

  static ForgetPasswordCubit of(context) => BlocProvider.of(context);

  final ForgetPassword forgetPasswordUseCase;
  final VerificationCode verificationCodeUseCase;
  final ChangePassword changePasswordUseCase;

  final emailController = TextEditingController();
  final pinCodeController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final formKeyForgetPassword = GlobalKey<FormState>();
  final formKeyChangePassword = GlobalKey<FormState>();
  final formKeyVerificationCode = GlobalKey<FormState>();

  Future changePassword() async {
    if (formKeyChangePassword.currentState!.validate()) {
      emit(ChangePasswordLoading());
      final res = await changePasswordUseCase.execute(
        pinCodeController.text,
        passwordController.text,
        passwordConfirmController.text,
      );
      res.fold(
        (err) {
          showSnackBar(err.message);
          emit(ChangePasswordError());
        },
        (res) async {
          emit(ChangePasswordLoaded());
          showSnackBar(res.message ?? '');
          MagicRouter.navigateAndPopAll(const LoginProviderScreen());
        },
      );
    }
  }

  Future verificationCode(BuildContext context) async {
    if (formKeyVerificationCode.currentState!.validate()) {
      emit(VerificationCodeLoading());
      final res = await verificationCodeUseCase.execute(pinCodeController.text);
      res.fold(
        (err) {
          showSnackBar(err.message);
          emit(VerificationCodeError());
        },
        (res) async {
          emit(VerificationCodeLoaded());
          MagicRouter.navigateTo(
            BlocProvider.value(
              value: ForgetPasswordCubit.of(context),
              child: const ChangePasswordScreen(),
            ),
          );
        },
      );
    }
  }

  Future forgetPassword(BuildContext context) async {
    if (formKeyForgetPassword.currentState!.validate()) {
      emit(ForgetPasswordLoading());
      final res = await forgetPasswordUseCase.execute(emailController.text);
      res.fold(
        (err) {
          showSnackBar(err.message);
          emit(ForgetPasswordError());
        },
        (res) async {
          emit(ForgetPasswordLoaded());
          MagicRouter.navigateTo(
            BlocProvider.value(
              value: ForgetPasswordCubit.of(context),
              child: const VerificationCodeScreen(),
            ),
          );
        },
      );
    }
  }
}
