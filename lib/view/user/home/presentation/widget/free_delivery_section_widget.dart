import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/view/user/products/presentation/screen/all_free_delivery_screen.dart';
import 'package:wein_buyer/widgets/product_item.dart';

import '../../../../../../../core/models/product.dart';
import '../../../../../../../core/router/router.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';

class FreeDeliverySectionWidget extends StatelessWidget {
  const FreeDeliverySectionWidget({Key? key, required this.freeDelivery})
      : super(key: key);

  final List<Product> freeDelivery;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getProportionateScreenHeight(310),
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
                      AppStrings.freeShipping.translate(),
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
                    MagicRouter.navigateTo(const AllFreeDeliveryScreen());
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
              itemCount: freeDelivery.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductItem(
                  product: freeDelivery[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
