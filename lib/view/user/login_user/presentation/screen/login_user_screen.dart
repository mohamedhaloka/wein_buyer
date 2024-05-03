import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/user/login_user/presentation/controller/login_cubit.dart';

import '../../../../../../../core/services/services_locator.dart';
import '../widget/login_user_body.dart';

class LoginUserScreen extends StatelessWidget {
  const LoginUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginUserCubit(sl()),
      child: const Scaffold(
        body: LoginUserBody(),
      ),
    );
  }
}
