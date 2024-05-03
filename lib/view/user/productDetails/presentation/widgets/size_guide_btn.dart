import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import '../../../../../../../core/models/product_details.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../sizeGuide/presentation/screen/size_guide_screen.dart';

class SizeGuideBTN extends StatelessWidget {
  const SizeGuideBTN({Key? key, required this.product}) : super(key: key);

  final ProductDetails product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MagicRouter.navigateTo(SizeGuideScreen(
          sizeGuide: product.sizeGuide ?? [],
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.getProportionateScreenWidth(25),
          vertical: AppSizes.getProportionateScreenHeight(10),
        ),
        color: const Color.fromRGBO(251, 251, 251, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.mapMarketBody.translate(),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.fontColor,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.fontColor,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
