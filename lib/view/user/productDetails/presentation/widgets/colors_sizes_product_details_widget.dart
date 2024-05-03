import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_func.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/controller/product_details_cubit.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import '../../../../../../../core/models/product_details.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';

class ColorsSizesProductDetailsWidget extends StatefulWidget {
  const ColorsSizesProductDetailsWidget({Key? key, required this.product})
      : super(key: key);

  final ProductDetails product;

  @override
  State<ColorsSizesProductDetailsWidget> createState() =>
      _ColorsSizesProductDetailsWidgetState();
}

class _ColorsSizesProductDetailsWidgetState
    extends State<ColorsSizesProductDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getProportionateScreenWidth(25),
        vertical: AppSizes.getProportionateScreenHeight(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.product.product!.propertiesMap!.color!.isEmpty
              ? const SizedBox()
              : Text(
                  AppStrings.colors.translate(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.fontColor,
                  ),
                ),
          SpaceH(inputHeigth: 10),
          widget.product.product!.propertiesMap!.color!.isEmpty
              ? const SizedBox()
              : Row(
                  children: List.generate(
                    widget.product.product!.propertiesMap!.color!.length,
                    (index) => widget.product.product!.propertiesMap!
                            .color![index].isEmpty
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  AppSizes.getProportionateScreenWidth(2),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  ProductDetailsCubit.of(context)
                                      .selectedItemColor = index;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(
                                  AppSizes.getProportionateScreenWidth(3),
                                ),
                                decoration: ProductDetailsCubit.of(context)
                                            .selectedItemColor ==
                                        index
                                    ? BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.primaryColor,
                                        ),
                                      )
                                    : null,
                                child: Container(
                                  width: AppSizes.getProportionateScreenWidth(
                                      ProductDetailsCubit.of(context)
                                                  .selectedItemColor ==
                                              index
                                          ? 30
                                          : 35),
                                  height: AppSizes.getProportionateScreenWidth(
                                      ProductDetailsCubit.of(context)
                                                  .selectedItemColor ==
                                              index
                                          ? 30
                                          : 35),
                                  decoration: BoxDecoration(
                                    color: HexColor.fromHex(widget.product
                                        .product!.propertiesMap!.color![index]),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
          SpaceH(inputHeigth: 15),
          widget.product.product!.propertiesMap!.size!.isEmpty
              ? const SizedBox()
              : Text(
                  AppStrings.sized.translate(),
                  style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          SpaceH(inputHeigth: 10),
          widget.product.product!.propertiesMap!.size!.isEmpty
              ? const SizedBox()
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      widget.product.product!.propertiesMap!.size!.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.getProportionateScreenWidth(5),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              ProductDetailsCubit.of(context).selectedItemSize =
                                  index;
                            });
                          },
                          child: Container(
                            width: AppSizes.getProportionateScreenWidth(65),
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  AppSizes.getProportionateScreenWidth(15),
                              vertical:
                                  AppSizes.getProportionateScreenHeight(10),
                            ),
                            decoration: ProductDetailsCubit.of(context)
                                        .selectedItemSize ==
                                    index
                                ? BoxDecoration(
                                    color: AppColors.primaryColor
                                        .withOpacity(0.07),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                      width: 1,
                                    ),
                                  )
                                : null,
                            alignment: Alignment.center,
                            child: Text(
                              widget
                                  .product.product!.propertiesMap!.size![index],
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: ProductDetailsCubit.of(context)
                                            .selectedItemSize ==
                                        index
                                    ? AppColors.primaryColor
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
