import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../../../core/router/router.dart';
import '../../../../../../../widgets/snackBar.dart';
import '../../../editProfileUser/presentation/screen/change_password_screen.dart';
import '../../../login_user/presentation/screen/login_user_screen.dart';
import '../../domain/usecases/change_password.dart';
import '../../domain/usecases/forget_password.dart';
import '../../domain/usecases/verification_code.dart';
import '../screen/reset_password_screen.dart';
import '../screen/verification_code_screen.dart';

part 'forget_password_state.dart';

class ForgetPasswordUserCubit extends Cubit<ForgetPasswordUserState> {
  ForgetPasswordUserCubit(this.forgetPasswordUseCase, this.verificationCodeUseCase,
      this.changePasswordUseCase)
      : super(ForgetPasswordInitial());

  static ForgetPasswordUserCubit of(context) => BlocProvider.of(context);

  final ForgetPasswordUser forgetPasswordUseCase;
  final VerificationCodeUser verificationCodeUseCase;
  final ChangePasswordUser changePasswordUseCase;

  final phoneController = TextEditingController();
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
          MagicRouter.navigateAndPopAll(const LoginUserScreen());
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
              value: ForgetPasswordUserCubit.of(context),
              child: const ResetPasswordScreen(),
            ),
          );
        },
      );
    }
  }

  Future forgetPassword(BuildContext context) async {
    if (formKeyForgetPassword.currentState!.validate()) {
      emit(ForgetPasswordLoading());
      final res = await forgetPasswordUseCase.execute(phoneController.text);
      res.fold(
        (err) {
          showSnackBar(err.message);
          emit(ForgetPasswordError());
        },
        (res) async {
          emit(ForgetPasswordLoaded());
          MagicRouter.navigateTo(
            BlocProvider.value(
              value: ForgetPasswordUserCubit.of(context),
              child: const VerificationCodeScreen(),
            ),
          );
        },
      );
    }
  }
}
