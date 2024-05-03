import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/provider/forgetPassword/presentation/controller/forget_password_cubit.dart';

import '../../../../../../core/services/services_locator.dart';
import '../widget/forget_password_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(sl(), sl(), sl()),
      child: const Scaffold(
        body: ForgetPasswordBody(),
      ),
    );
  }
}
