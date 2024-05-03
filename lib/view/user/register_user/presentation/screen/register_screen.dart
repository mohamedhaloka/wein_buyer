import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/user/register_user/presentation/controller/register_cubit.dart';

import '../../../../../../../core/services/services_locator.dart';
import '../widget/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterUserCubit(sl()),
      child: const Scaffold(
        body: RegisterBody(),
      ),
    );
  }
}
