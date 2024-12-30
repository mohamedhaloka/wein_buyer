import 'package:carousel_slider/carousel_slider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/screen/media_view.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import 'package:wein_buyer/widgets/video_thumbnail_widget.dart';

import '../../../../../../../core/models/product_details.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../favorites/presentation/controller/favorites_cubit.dart';
import 'image_item.dart';

class ImgNamePriceProductDetailsWidget extends StatefulWidget {
  const ImgNamePriceProductDetailsWidget({Key? key, required this.product})
      : super(key: key);

  final ProductDetails product;

  @override
  State<ImgNamePriceProductDetailsWidget> createState() =>
      _ImgNamePriceProductDetailsWidgetState();
}

class _ImgNamePriceProductDetailsWidgetState
    extends State<ImgNamePriceProductDetailsWidget> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getProportionateScreenWidth(25),
        vertical: AppSizes.getProportionateScreenHeight(10),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: AppSizes.screenHeight * 0.2,
                    width: AppSizes.screenWidth,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 1,
                        disableCenter: true,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: widget.product.product!.files!.map((item) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MediaView(
                                  items: (widget.product.product?.files ?? [])
                                      .map((e) {
                                    if (e.type == 'video') {
                                      return MediaItem.video(src: e.file!);
                                    }

                                    return MediaItem.img(src: e.file!);
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                          child: item.type == 'video'
                              ? VideoThumbnailWidget(item.file)
                              : ImageItem(item: item),
                        );
                      }).toList(),
                    ),
                  ),
                  Positioned(
                    bottom: AppSizes.getProportionateScreenWidth(10),
                    right: 0,
                    left: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: (widget.product.product?.files ?? [])
                          .asMap()
                          .entries
                          .map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 8.sp,
                            height: 8.sp,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : _current == entry.key
                                      ? Colors.blue
                                      : Colors.black26),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizes.getProportionateScreenHeight(5),
                    horizontal: AppSizes.getProportionateScreenWidth(10),
                  ),
                  child: Text(
                    '-${widget.product.product!.discount!.toDouble().toStringAsFixed(2)}%',
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
                  isFavorite: widget.product.product!.inFavorite,
                  iconSize: 25.sp,
                  valueChanged: (bool value) {
                    if (value) {
                      FavoritesCubit.of(context)
                          .addFavoriteItem(widget.product.product!.id!);
                    } else {
                      FavoritesCubit.of(context)
                          .removeFavoriteItem(widget.product.product!.id!);
                      FavoritesCubit.of(context).listOfFavorites.removeWhere(
                          (element) =>
                              element.id == widget.product.product!.id);
                    }
                  },
                ),
              ),
            ],
          ),
          SpaceH(inputHeigth: 10),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              widget.product.product!.name ?? '',
              maxLines: 3,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.fontColor,
              ),
            ),
          ),
          SpaceH(inputHeigth: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                  Text(
                    '${widget.product.product!.distance} ${AppStrings.howMuch.translate()}',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: widget.product.product!.rate!.toDouble(),
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 18.sp,
                    direction: Axis.horizontal,
                  ),
                  Text(
                    '(${widget.product.product!.rate})',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.GrayColor112,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SpaceH(inputHeigth: 10),
          Row(
            children: [
              Row(
                children: [
                  Text(
                    widget.product.product!.priceAfterDiscount!
                        .toDouble()
                        .toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    widget.product.product!.currency ?? '',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              if (widget.product.product!.price !=
                  widget.product.product!.priceAfterDiscount) ...[
                SpaceW(inputWidth: 5),
                Text(
                  '${widget.product.product!.price!.toDouble().toStringAsFixed(2)} ${widget.product.product!.currency}',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
