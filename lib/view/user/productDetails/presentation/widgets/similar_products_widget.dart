import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/widgets/product_item.dart';
import '../../../../../../../core/models/product.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../core/utils/app_strings.dart';

class SimilarProductsWidget extends StatelessWidget {
  const SimilarProductsWidget({Key? key, required this.listOfProduct})
      : super(key: key);

  final List<Product> listOfProduct;

  @override
  Widget build(BuildContext context) {
    return listOfProduct.isEmpty
        ? const SizedBox()
        : Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getProportionateScreenWidth(25),
              vertical: AppSizes.getProportionateScreenHeight(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.similarProductsWidget.translate(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.fontColor,
                  ),
                ),
                SpaceH(inputHeigth: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      listOfProduct.length,
                      (index) => ProductItem(
                        product: listOfProduct[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
