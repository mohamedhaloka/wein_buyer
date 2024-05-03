import 'package:flutter/material.dart';
import 'package:wein_buyer/view/provider/sizeGuide/presentation/widget/size_guide_item.dart';

import '../../../../../../core/models/size_guides_model.dart';

class SizeGuideListWidget extends StatelessWidget {
  const SizeGuideListWidget({Key? key, required this.listOfSizeGuide}) : super(key: key);

  final List<SizeGuides> listOfSizeGuide;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfSizeGuide.length,
      itemBuilder: (context, index) {
        return SizeGuideItem(
          sizeGuides: listOfSizeGuide[index],
        );
      },
    );
  }
}
