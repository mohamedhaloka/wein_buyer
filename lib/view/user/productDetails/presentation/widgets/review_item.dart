import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../../../core/models/product_details.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_height.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({Key? key, required this.rate}) : super(key: key);

  final Rates rate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.getProportionateScreenHeight(3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    rate.name ?? '',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.fontColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    rate.createdAt ?? '',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.GrayColor112,
                    ),
                  ),
                ],
              ),
              SpaceH(inputHeigth: 7),
              RatingBarIndicator(
                rating: rate.rate!.toDouble(),
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 18.sp,
                direction: Axis.horizontal,
              ),
              SpaceH(inputHeigth: 7),
              Text(
                rate.comment ?? '',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.fontColor,
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
