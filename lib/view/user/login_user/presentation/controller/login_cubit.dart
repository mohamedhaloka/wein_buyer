import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/blocks/lang_cubit/lang_cubit.dart';
import 'package:wein_buyer/view/user/bottom_nav_user/presentation/screens/bottom_nav_user_screen.dart';
import 'package:wein_buyer/view/user/pages/view/currencies/presentation/screen/currencies_screen.dart';
import '../../../../../../../core/appStorage/app_storage.dart';
import '../../../../../../../core/router/router.dart';
import '../../../../../../../widgets/snackBar.dart';
import '../../domain/usecases/login.dart';

part 'login_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit(this.loginUseCase) : super(LoginInitial());

  final LoginUser loginUseCase;

  static LoginUserCubit of(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  Future login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      final res = await loginUseCase.execute(
          phoneController.text, passwordController.text);
      res.fold(
        (err) {
          showSnackBar(err.message);
          emit(LoginError());
        },
        (res) async {
          emit(LoginLoaded());
          await AppStorage.cacheUserInfo(res);
          await AppStorage.cacheUserType(1);
          String lang = context.read<LangCubit>().state.locale.languageCode;
          await AppStorage.cacheLang(lang);
          MagicRouter.navigateAndPopAll(const CurrenciesScreen());
          // MagicRouter.navigateAndPopAll(BottomNavUserScreen(selectedIndex: 0));
        },
      );
    }
  }
}
