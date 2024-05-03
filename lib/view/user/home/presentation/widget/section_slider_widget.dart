import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/view/user/products/presentation/screen/products_screen.dart';
import 'package:wein_buyer/widgets/section_item.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../../core/models/category.dart';
import '../../../../../../../core/router/router.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';

class SectionSliderWidget extends StatelessWidget {
  const SectionSliderWidget({Key? key, required this.categories})
      : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getProportionateScreenHeight(170),
      child: Column(
        children: [
          Container(
            height: AppSizes.getProportionateScreenHeight(50),
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getProportionateScreenWidth(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.section.translate(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                  ),
                ),
                TextButton(
                  child: Text(
                    AppStrings.seeAll.translate(),
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    MagicRouter.navigateTo(const ProductsScreen(
                      subCateId: 0,
                    ));
                  },
                ),
              ],
            ),
          ),
          SpaceH(inputHeigth: 10),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsetsDirectional.only(
                start: AppSizes.getProportionateScreenWidth(10),
              ),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SectionItem(
                  category: categories[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
