import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/provider/returnPolicy/presentation/controller/return_policy_cubit.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';

import '../../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/return_policy_body.dart';

class ReturnPolicyScreen extends StatelessWidget {
  const ReturnPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReturnPolicyCubit(sl() , sl())..getReturnPolicy(),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.returnPolicyScreen.translate(),
        ),
        body: ReturnPolicyBody(),
      ),
    );
  }
}
