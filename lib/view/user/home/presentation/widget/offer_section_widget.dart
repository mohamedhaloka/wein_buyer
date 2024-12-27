import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/view/user/products/presentation/screen/all_offers_screen.dart';
import 'package:wein_buyer/widgets/product_item.dart';

import '../../../../../../../core/models/product.dart';
import '../../../../../../../core/router/router.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';

class OfferSectionWidget extends StatelessWidget {
  const OfferSectionWidget({Key? key, required this.offers}) : super(key: key);

  final List<Product> offers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getProportionateScreenHeight(315),
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
                Row(
                  children: [
                    Text(
                      AppStrings.offers.translate(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(
                      width: AppSizes.getProportionateScreenWidth(25),
                      child: Lottie.asset(AppAssets.fire_lottie),
                    ),
                  ],
                ),
                TextButton(
                  child: Text(
                    AppStrings.showAll.translate(),
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    MagicRouter.navigateTo(const AllOffersScreen());
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: AppSizes.getProportionateScreenWidth(18),
              ),
              itemCount: offers.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductItem(
                  product: offers[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
