import 'package:flutter/material.dart';

import '../../../../../../../core/models/product_details.dart';
import 'size_guide_item.dart';

class SizeGuideListWidget extends StatelessWidget {
  const SizeGuideListWidget({Key? key, required this.sizeGuide}) : super(key: key);

  final List<SizeGuide> sizeGuide;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sizeGuide.length,
      itemBuilder: (context, index) {
        return SizeGuideItem(
          sizeGuide: sizeGuide[index],
        );
      },
    );
  }
}
