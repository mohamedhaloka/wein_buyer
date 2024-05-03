import 'package:flutter/material.dart';

import '../core/utils/app_sizes.dart';

class SpaceW extends StatelessWidget {
  SpaceW({Key? key, required this.inputWidth}) : super(key: key);

  final double inputWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.getProportionateScreenWidth(inputWidth),
    );
  }
}
