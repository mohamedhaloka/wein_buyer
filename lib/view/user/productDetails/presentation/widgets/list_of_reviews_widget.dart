import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/widgets/review_item.dart';

import '../../../../../../../core/models/product.dart';
import '../../../../../../../core/models/product_details.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../reviews/presentation/screen/reviews_screen.dart';

class ListOfReviewsWidget extends StatelessWidget {
  const ListOfReviewsWidget({Key? key, required this.product})
      : super(key: key);

  final ProductDetails product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getProportionateScreenWidth(25),
        vertical: AppSizes.getProportionateScreenHeight(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.ratings.translate(),
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.fontColor,
            ),
          ),
          SpaceH(inputHeigth: 10),
          Column(
            children: List.generate(
              product.rates!.length,
              (index) => ReviewItem(
                rate: product.rates![index],
              ),
            ),
          ),
          SpaceH(inputHeigth: 10),
          InkWell(
            onTap: () {
              MagicRouter.navigateTo(ReviewsScreen(
                rate: product.rates ?? [],
              ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.showMore.translate(),
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primaryColor,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
