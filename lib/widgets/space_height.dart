import 'package:flutter/material.dart';

import '../core/utils/app_sizes.dart';

class SpaceH extends StatelessWidget {
  SpaceH({Key? key, required this.inputHeigth}) : super(key: key);

  final double inputHeigth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getProportionateScreenHeight(inputHeigth),
    );
  }
}
