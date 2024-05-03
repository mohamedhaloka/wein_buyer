import 'package:carousel_slider/carousel_slider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/view/user/favorites/presentation/controller/favorites_cubit.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/screen/product_details_screen.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import 'package:wein_buyer/widgets/space_width.dart';
import 'package:wein_buyer/widgets/video_thumbnail_widget.dart';

import '../core/models/product.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_sizes.dart';
import '../core/utils/app_strings.dart';
import 'custom_network_image.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(5),
        horizontal: AppSizes.getProportionateScreenWidth(5),
      ),
      child: InkWell(
        onTap: () {
          MagicRouter.navigateTo(ProductDetailsScreen(
            productId: product.id!,
          ));
        },
        child: Container(
          width: AppSizes.getProportionateScreenWidth(160),
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.getProportionateScreenHeight(10),
            horizontal: AppSizes.getProportionateScreenWidth(5),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(
              AppSizes.getProportionateScreenWidth(3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CarouselSlider(
                        options: CarouselOptions(
                            height: AppSizes.getProportionateScreenHeight(120)),
                        items: product.files!.map((e) {
                          return e.type == 'video'
                              ? VideoThumbnailWidget(e.file)
                              : CustomNetworkImage(url: e.file ?? '');
                        }).toList(),
                      ),
                    ),
                    product.discount == 0
                        ? const SizedBox()
                        : Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    AppSizes.getProportionateScreenHeight(5),
                                horizontal:
                                    AppSizes.getProportionateScreenWidth(10),
                              ),
                              child: Text(
                                '-${product.discount}%',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: FavoriteButton(
                        isFavorite: product.inFavorite,
                        iconSize: 30.sp,
                        valueChanged: (bool value) {
                          if (value) {
                            FavoritesCubit.of(context)
                                .addFavoriteItem(product.id!);
                          } else {
                            FavoritesCubit.of(context)
                                .removeFavoriteItem(product.id!);
                            FavoritesCubit.of(context)
                                .listOfFavorites
                                .removeWhere(
                                    (element) => element.id == product.id);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SpaceH(inputHeigth: 10),
                Text(
                  product.name ?? '',
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                RatingBarIndicator(
                  rating: product.rate!.toDouble(),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 18.sp,
                  direction: Axis.horizontal,
                ),
                SpaceH(inputHeigth: 2),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                    Text(
                      '${product.distance}${AppStrings.howMuch.translate()}',
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                SpaceH(inputHeigth: 5),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          product.priceAfterDiscount!
                              .toDouble()
                              .toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Text(
                          product.currency ?? '',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SpaceW(inputWidth: 5),
                    Expanded(
                      child: Text(
                        '${product.price!.toDouble().toStringAsFixed(2)} ${product.currency}',
                        maxLines: 1,
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
