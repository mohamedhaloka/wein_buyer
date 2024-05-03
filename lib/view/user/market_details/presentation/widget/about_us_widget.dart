import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/controller/product_details_cubit.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../../../widgets/tab_widget.dart';
import '../../../../../core/utils/app_strings.dart';
import 'edit_market_details_bottom_sheet.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const TabWidget(),
            SpaceW(inputWidth: 20),
            Text(
              AppStrings.aboutUsWidget.translate(),
              style: TextStyle(
                color: AppColors.fontColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(20),
          ),
          child: Text(
            ProductDetailsCubit.of(context).marketDetails!.description??'',
            style: TextStyle(
              color: AppColors.GrayColor112,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
