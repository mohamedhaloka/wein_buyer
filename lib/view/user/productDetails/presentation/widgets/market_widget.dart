import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/widgets/space_width.dart';

import '../../../../../../../core/models/product.dart';
import '../../../../../../../core/models/product_details.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/snackBar.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../market_details/presentation/screen/market_details_screen.dart';

class MarketWidget extends StatelessWidget {
  const MarketWidget({Key? key, required this.product}) : super(key: key);

  final ProductDetails product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getProportionateScreenWidth(25),
        vertical: AppSizes.getProportionateScreenHeight(10),
      ),
      child: InkWell(
        onTap: (){
          if (AppStorage.isLogged) {
            MagicRouter.navigateTo(MarketDetailsScreen(
              marketId: product.merchant!.id!,
            ));
          } else {
            showSnackBar(
              AppStrings.pleaseLogin.translate(),
              pleaseLogin: true,
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.store.translate(),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.fontColor,
              ),
            ),
            SpaceH(inputHeigth: 10),
            Row(
              children: [
                SizedBox(
                  width: AppSizes.getProportionateScreenWidth(100),
                  height: AppSizes.getProportionateScreenWidth(100),
                  child: CachedNetworkImage(
                    imageUrl: product.merchant!.image ?? '',
                  ),
                ),
                SpaceW(inputWidth: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.merchant!.name ?? '',
                      style: TextStyle(
                          color: AppColors.fontColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SpaceH(inputHeigth: 10),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: product.merchant!.rate!.toDouble(),
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 18.sp,
                          direction: Axis.horizontal,
                        ),
                        Text(
                          '(${product.merchant!.rateCount})',
                          style: TextStyle(
                              color: AppColors.GrayColor112,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SpaceH(inputHeigth: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.showStore.translate(),
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
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
