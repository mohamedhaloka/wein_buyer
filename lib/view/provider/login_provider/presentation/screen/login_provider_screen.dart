import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/provider/login_provider/presentation/controller/login_cubit.dart';

import '../../../../../../core/services/services_locator.dart';
import '../widget/login_provider_body.dart';

class LoginProviderScreen extends StatelessWidget {
  const LoginProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(sl())..getInitialData(),
      child: const Scaffold(
        body: LoginProviderBody(),
      ),
    );
  }
}
