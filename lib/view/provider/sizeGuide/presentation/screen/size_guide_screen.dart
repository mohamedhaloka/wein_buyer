import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/provider/sizeGuide/presentation/controller/size_guide_cubit.dart';
import '../../../../../../core/services/services_locator.dart';
import '../../../../../../widgets/custom_appbar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/custom_floating_action.dart';
import '../widget/size_guide_body.dart';

class SizeGuideScreen extends StatelessWidget {
  const SizeGuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SizeGuideCubit(sl(), sl() , sl() , sl())..getSizeGuides(),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.mapMarketBody.translate(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: const CustomFloatingAction(),
        body: const SizeGuideBody(),
      ),
    );
  }
}
