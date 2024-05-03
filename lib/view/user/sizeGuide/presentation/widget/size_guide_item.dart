import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import 'package:wein_buyer/widgets/space_width.dart';
import 'package:wein_buyer/widgets/tab_widget.dart';
import '../../../../../../../core/models/product_details.dart';
import '../../../../../core/utils/app_strings.dart';

class SizeGuideItem extends StatelessWidget {
  const SizeGuideItem({Key? key, required this.sizeGuide}) : super(key: key);

  final SizeGuide sizeGuide;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const TabWidget(),
              SpaceW(inputWidth: 10),
              Text(
                AppStrings.guideFor.translate(),
                style: TextStyle(
                  color: AppColors.fontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
          SpaceH(inputHeigth: 20),
          Container(
            padding: EdgeInsets.all(
              AppSizes.getProportionateScreenWidth(10),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.GrayColor239,
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: sizeGuide.image ?? '',
            ),
          ),
        ],
      ),
    );
  }
}
