import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/models/products_provider_model.dart';
import 'package:wein_buyer/widgets/video_thumbnail_widget.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_sizes.dart';
import '../view/provider/market/presentation/controller/market_cubit.dart';
import '../view/provider/market/presentation/widget/more_for_product_item.dart';
import 'custom_network_image.dart';
import 'space_height.dart';
import 'space_width.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.productData}) : super(key: key);

  final ProductData productData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(5),
        horizontal: AppSizes.getProportionateScreenWidth(5),
      ),
      child: Stack(
        children: [
          Container(
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                          height: AppSizes.getProportionateScreenHeight(160)),
                      itemBuilder: (context, index, realIndex) => productData
                                  .files![index].type ==
                              'video'
                          ? VideoThumbnailWidget(productData.files![index].file)
                          : CustomNetworkImage(
                              url: productData.files![index].file ?? '',
                            ),
                      itemCount: productData.files?.length ?? 0,
                    ),
                  ),
                  SpaceH(inputHeigth: 5),
                  Text(
                    productData.name ?? '',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                  RatingBarIndicator(
                    rating: productData.rate!.toDouble(),
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
                        productData.distance ?? '',
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            (productData.priceAfterDiscount ?? 0.0).toString(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            productData.currency ?? '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SpaceW(inputWidth: 5),
                      productData.discount == 0
                          ? const SizedBox()
                          : Row(
                              children: [
                                Text(
                                  (productData.price ?? 0.0).toString(),
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  productData.currency ?? '',
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  isDismissible: false,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  backgroundColor: Colors.redAccent.withOpacity(0),
                  builder: (BuildContext cont) {
                    return BlocProvider.value(
                      value: MarketCubit.of(context),
                      child: MoreForProductItem(
                        productData: productData,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          productData.discount == 0
              ? const SizedBox()
              : PositionedDirectional(
                  end: 10,
                  top: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.getProportionateScreenHeight(2),
                      horizontal: AppSizes.getProportionateScreenWidth(10),
                    ),
                    child: Text(
                      '-${productData.discount ?? 0}%',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
