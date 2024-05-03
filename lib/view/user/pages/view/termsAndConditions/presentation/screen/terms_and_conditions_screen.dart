import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';

import '../../../../../../../../../core/services/services_locator.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../../controller/pages_cubit.dart';
import '../widget/terms_and_conditions_body.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PagesCubit(sl(), sl(), sl() , sl())..getTerms(),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.termsAndConditionsScreen.translate(),
        ),
        body: const TermsAndConditionsBody(),
      ),
    );
  }
}
