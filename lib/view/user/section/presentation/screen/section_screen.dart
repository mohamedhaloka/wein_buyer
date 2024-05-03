import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/section/presentation/controller/section_cubit.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';
import '../../../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widgets/section_body.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({Key? key, required this.cateId}) : super(key: key);

  final int cateId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SectionCubit(sl(), sl())..getMainCates(
        cateId: cateId
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.section.translate(),
        ),
        body: const SectionBody(),
      ),
    );
  }
}
