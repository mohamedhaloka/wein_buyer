import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/editProfileUser/presentation/controller/edit_profile_cubit.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';

import '../../../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/edit_profile_body.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(sl() , sl() , sl() , sl())..getProfileData(),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.accountDetails.translate(),
        ),
        body: const EditProfileBody(),
      ),
    );
  }
}
