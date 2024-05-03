import 'package:flutter/material.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/widgets/review_item.dart';
import '../../../../../../../core/models/product_details.dart';
import '../../../../../../../core/utils/app_sizes.dart';

class ReviewsBody extends StatelessWidget {
  const ReviewsBody({Key? key, required this.rate}) : super(key: key);

  final List<Rates> rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.getProportionateScreenHeight(15),
              horizontal: AppSizes.getProportionateScreenWidth(20),
            ),
            child: ListView.separated(
              itemCount: rate.length,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                return ReviewItem(
                  rate: rate[index],
                );
              },
            ),
          );
  }
}
