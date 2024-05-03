import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/provider/bottom_nav_provider/presentation/screens/bottom_nav_provider_screen.dart';
import '../../../../../../core/appStorage/app_storage.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../../widgets/snackBar.dart';
import '../../../../../core/blocks/lang_cubit/lang_cubit.dart';
import '../../domain/usecases/login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  final Login loginUseCase;

  static LoginCubit of(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      final res = await loginUseCase.execute(
          emailController.text, passwordController.text);
      res.fold(
        (err) {
          showSnackBar(err.message);
          emit(LoginError());
        },
        (res) async {
          emit(LoginLoaded());
          await AppStorage.cacheUserProviderInfo(res);
          await AppStorage.cacheUserType(0);
          await AppStorage.cacheOpenStatus(res.user!.user!.open ?? false);
          String lang = context.read<LangCubit>().state.locale.languageCode;
          await AppStorage.cacheLang(lang);
          MagicRouter.navigateAndPopAll(BottomNavProviderScreen(selectedIndex: 0,));
        },
      );
    }
  }
}
