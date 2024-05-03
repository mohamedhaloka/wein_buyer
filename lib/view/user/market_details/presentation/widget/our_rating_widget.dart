import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../../../widgets/tab_widget.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../productDetails/presentation/controller/product_details_cubit.dart';

class OurRatingWidget extends StatelessWidget {
  const OurRatingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const TabWidget(),
            SpaceW(inputWidth: 20),
            Text(
              AppStrings.ourRatingWidget.translate(),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: AppSizes.getProportionateScreenWidth(85),
                    height: AppSizes.getProportionateScreenWidth(85),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 229, 48, 1)
                          .withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${ProductDetailsCubit.of(context).marketDetails!.rateMap!.rate}",
                      style: TextStyle(
                        fontSize: 46.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(255, 229, 48, 1),
                      ),
                    ),
                  ),
                  RatingBarIndicator(
                    rating: ProductDetailsCubit.of(context)
                        .marketDetails!
                        .rateMap!
                        .rate!
                        .toDouble(),
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 16.sp,
                    direction: Axis.horizontal,
                  ),
                  Text(
                    '(${ProductDetailsCubit.of(context).marketDetails!.rateMap!.count})',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Column(
                children: List.generate(
                  ProductDetailsCubit.of(context)
                      .marketDetails!
                      .rateMap!
                      .rates!
                      .length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.getProportionateScreenHeight(3),
                    ),
                    child: Row(
                      children: [
                        Text(
                          ProductDetailsCubit.of(context)
                              .marketDetails!
                              .rateMap!
                              .rates![index]
                              .key
                              .toString(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.star,
                          color: Color.fromRGBO(255, 229, 48, 1),
                        ),
                        SpaceW(inputWidth: 10),
                        SizedBox(
                          width: AppSizes.screenWidth * 0.35,
                          child: LinearProgressIndicator(
                            value: ProductDetailsCubit.of(context)
                                    .marketDetails!
                                    .rateMap!
                                    .rates![index]
                                    .value!
                                    .toDouble() /
                                10,
                            backgroundColor: Colors.grey,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color.fromRGBO(255, 229, 48, 1),
                            ),
                          ),
                        ),
                        SpaceW(inputWidth: 10),
                        Text(
                          '(${ProductDetailsCubit.of(context).marketDetails!.rateMap!.rates![index].value})',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
