import 'package:flutter/material.dart';

import '../../../../../../../../../core/utils/app_assets.dart';
import '../../../../../../../../../core/utils/app_sizes.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(15),
        horizontal: AppSizes.getProportionateScreenWidth(20),
      ),
      child: Center(
        child: Image.asset(
          AppAssets.no_data_cuate,
        ),
      ),
    );
  }
}
