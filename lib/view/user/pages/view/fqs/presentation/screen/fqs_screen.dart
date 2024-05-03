import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/pages/view/controller/pages_cubit.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';
import '../../../../../../../../../core/services/services_locator.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../widget/fqs_body.dart';

class FqsScreen extends StatelessWidget {
  const FqsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PagesCubit(sl(), sl(), sl() , sl())..getFaqs(),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.questionCommon.translate(),
        ),
        body: FqsBody(),
      ),
    );
  }
}
