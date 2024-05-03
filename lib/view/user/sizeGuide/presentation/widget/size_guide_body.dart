import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/models/product_details.dart';
import 'empty_list_widget.dart';
import 'size_guide_list_widget.dart';

class SizeGuideBody extends StatelessWidget {
  const SizeGuideBody({Key? key, required this.sizeGuide}) : super(key: key);

  final List<SizeGuide> sizeGuide;

  @override
  Widget build(BuildContext context) {
    if(sizeGuide.isNotEmpty){
      return SizeGuideListWidget(
        sizeGuide: sizeGuide,
      );
    }else{
      return const EmptyListWidget();
    }
  }
}
