import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_width.dart';
import 'package:wein_buyer/widgets/tab_widget.dart';
import '../../../../../../../core/models/product.dart';
import '../../../../../../../widgets/product_item.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../productDetails/presentation/controller/product_details_cubit.dart';

class SectionsAndProductsWidget extends StatefulWidget {
  SectionsAndProductsWidget({Key? key, required this.marketId})
      : super(key: key);

  final int marketId;

  @override
  State<SectionsAndProductsWidget> createState() =>
      _SectionsAndProductsWidgetState();
}

class _SectionsAndProductsWidgetState extends State<SectionsAndProductsWidget> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const TabWidget(),
                SpaceW(inputWidth: 10),
                Row(
                  children: List.generate(
                    ProductDetailsCubit.of(context).listOfCates.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.getProportionateScreenWidth(5),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedItem = index;
                            ProductDetailsCubit.of(context).getMarketProducts(
                                widget.marketId,
                                ProductDetailsCubit.of(context)
                                    .listOfCates[index]
                                    .id!);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                AppSizes.getProportionateScreenWidth(15),
                            vertical: AppSizes.getProportionateScreenHeight(10),
                          ),
                          decoration: selectedItem == index
                              ? BoxDecoration(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.07),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                    width: 1,
                                  ),
                                )
                              : null,
                          child: Text(
                            ProductDetailsCubit.of(context)
                                    .listOfCates[index]
                                    .name ??
                                '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: selectedItem == index
                                  ? AppColors.primaryColor
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              buildWhen: (previous, current) =>
                  previous != current || current is GetMarketProductsLoaded,
              builder: (context, state) {
                if (state is GetMarketProductsLoading) {
                  return const LoadingIndicator();
                } else if (ProductDetailsCubit.of(context)
                    .listOfProductsOfCategories
                    .isEmpty) {
                  return Center(
                    child: Text(AppStrings.noProtects.translate()),
                  );
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent:
                          AppSizes.getProportionateScreenHeight(270),
                    ),
                    itemCount: ProductDetailsCubit.of(context)
                        .listOfProductsOfCategories
                        .length,
                    itemBuilder: (BuildContext ctx, index) {
                      return ProductItem(
                        product: ProductDetailsCubit.of(context)
                            .listOfProductsOfCategories[index],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
