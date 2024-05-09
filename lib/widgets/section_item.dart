import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/view/user/products/presentation/screen/products_screen.dart';
import 'package:wein_buyer/view/user/section/presentation/screen/section_screen.dart';

import '../core/models/category.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_sizes.dart';
import 'space_height.dart';

class SectionItem extends StatelessWidget {
  SectionItem({Key? key, required this.category, this.isSub = false})
      : super(key: key);

  final Category category;
  bool isSub;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getProportionateScreenWidth(10),
      ),
      child: InkWell(
        onTap: () {
          if (isSub) {
            MagicRouter.navigateTo(ProductsScreen(
              subCateId: category.id!,
            ));
          } else {
            MagicRouter.navigateTo(SectionScreen(
              cateId: category.id!,
            ));
          }
        },
        child: SizedBox(
          width: AppSizes.getProportionateScreenWidth(80),
          child: Column(
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                strokeWidth: 1,
                color: AppColors.primaryColor,
                dashPattern: const [7, 7],
                radius: const Radius.circular(50),
                child: Container(
                  padding:
                      EdgeInsets.all(AppSizes.getProportionateScreenWidth(3)),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(category.image ?? ''),
                  ),
                ),
              ),
              SpaceH(inputHeigth: 10),
              Text(
                category.name ?? '',
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.fontColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
