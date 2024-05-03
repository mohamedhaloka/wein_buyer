import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';

import '../../../../../../../../../core/services/services_locator.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../../controller/pages_cubit.dart';
import '../widget/privacy_policy_body.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PagesCubit(sl(), sl(), sl() , sl())..getPrivacyPolicy(),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.privacy.translate(),
        ),
        body: const PrivacyPolicyBody(),
      ),
    );
  }
}
