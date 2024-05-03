import 'package:flutter/material.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import '../../../../../../../../../widgets/custom_appbar.dart';
import '../../../../../../../core/models/product_details.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/size_guide_body.dart';

class SizeGuideScreen extends StatelessWidget {
  const SizeGuideScreen({Key? key, required this.sizeGuide}) : super(key: key);

  final List<SizeGuide> sizeGuide;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.sizeGuideBTN.translate(),
      ),
      body: SizeGuideBody(
        sizeGuide: sizeGuide,
      ),
    );
  }
}
