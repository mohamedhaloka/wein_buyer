import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';
import '../../../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/change_password_body.dart';
import '../controller/edit_profile_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(sl() , sl() , sl() , sl()),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.changePasswordBody.translate(),
        ),
        body: const ChangePasswordBody(),
      ),
    );
  }
}
