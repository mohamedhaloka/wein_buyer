import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/user/editProfileUser/presentation/controller/edit_profile_cubit.dart';

import '../../../../../../../core/appStorage/app_storage.dart';
import '../../../../../../../widgets/visitor_screen.dart';
import '../../../../../core/services/services_locator.dart';
import '../widget/my_account_body.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(sl(), sl(), sl(), sl())..getProfileData(),
      child: Scaffold(
        body: AppStorage.isLogged ? MyAccountBody() : VisitorScreen(),
      ),
    );
  }
}
