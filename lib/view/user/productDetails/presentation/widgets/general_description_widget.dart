import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';

import '../../../../../../../core/models/product.dart';
import '../../../../../../../core/models/product_details.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../core/utils/app_strings.dart';

class GeneralDescriptionWidget extends StatelessWidget {
  const GeneralDescriptionWidget({Key? key, required this.product}) : super(key: key);

  final ProductDetails product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getProportionateScreenWidth(25),
        vertical: AppSizes.getProportionateScreenHeight(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.generalDescription.translate(),
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.fontColor,
            ),
          ),
          SpaceH(inputHeigth: 10),
          Text(
            product.product!.description??'',
            style: TextStyle(
              color: AppColors.GrayColor112,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
