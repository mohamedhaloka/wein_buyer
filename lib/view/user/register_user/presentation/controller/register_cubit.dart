import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/view/user/bottom_nav_user/presentation/screens/bottom_nav_user_screen.dart';
import '../../../../../../../core/appStorage/app_storage.dart';
import '../../../../../../../core/router/router.dart';
import '../../../../../../../widgets/snackBar.dart';
import '../../data/model/register_model.dart';
import '../../domain/usecases/register.dart';

part 'register_state.dart';

class RegisterUserCubit extends Cubit<RegisterUserState> {
  RegisterUserCubit(this.registerUseCase) : super(RegisterInitial());

  final RegisterUser registerUseCase;

  static RegisterUserCubit of(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      final res = await registerUseCase.execute(RegisterModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneController.text,
        password: passwordController.text,
        email: emailController.text,
      ));
      res.fold(
        (err) {
          showSnackBar(err.message);
          emit(RegisterError());
        },
        (res) async {
          emit(RegisterLoaded());
          await AppStorage.cacheUserInfo(res);
          await AppStorage.cacheUserType(1);
          MagicRouter.navigateAndPopAll(BottomNavUserScreen(
            selectedIndex: 0,
          ));
        },
      );
    }
  }
}
