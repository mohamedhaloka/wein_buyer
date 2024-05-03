import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/categories_model.dart';
import 'package:wein_buyer/core/models/products_provider_model.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/provider/market/presentation/controller/market_cubit.dart';
import 'package:wein_buyer/widgets/space_width.dart';
import 'package:wein_buyer/widgets/tab_widget.dart';
import '../../../../../../widgets/loading_indicator.dart';
import '../../../../../../widgets/product_provider_item.dart';
import '../../../../../core/utils/app_strings.dart';

class SectionsAndProductsWidget extends StatelessWidget {
  const SectionsAndProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: AppSizes.screenWidth,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const TabWidget(),
                    SpaceW(inputWidth: 10),
                    BlocBuilder<MarketCubit, MarketState>(
                      builder: (context, state) {
                        List<CategoryData> listOfCategories = [];
                        listOfCategories
                            .addAll(MarketCubit.of(context).listOfCate);
                        return state is GetAllCategoriesLoading
                            ? const LoadingIndicator()
                            : Row(
                                children: List.generate(
                                  listOfCategories.length,
                                  (index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          AppSizes.getProportionateScreenWidth(5),
                                    ),
                                    child: InkWell(
                                      onTap: () => MarketCubit.of(context)
                                          .onTapOnCategoryItem(index),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: AppSizes
                                              .getProportionateScreenWidth(15),
                                          vertical: AppSizes
                                              .getProportionateScreenHeight(10),
                                        ),
                                        decoration: listOfCategories[index]
                                                .isSelected!
                                            ? BoxDecoration(
                                                color: AppColors.primaryColor
                                                    .withOpacity(0.07),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: AppColors.primaryColor,
                                                  width: 1,
                                                ),
                                              )
                                            : null,
                                        child: Text(
                                          listOfCategories[index].name ?? '',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: listOfCategories[index]
                                                    .isSelected!
                                                ? AppColors.primaryColor
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<MarketCubit, MarketState>(
              buildWhen: (previous, current) =>
                  previous != current || current is GetProductsLoaded,
              builder: (context, state) {
                List<ProductData> listOfProduct = [];
                listOfProduct.addAll(MarketCubit.of(context).listOfProduct);
                return state is GetProductsLoading
                    ? const LoadingIndicator()
                    : listOfProduct.isEmpty
                        ?  Center(child: Text(AppStrings.sectionsAndProductsWidget.translate()))
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent:
                                  AppSizes.getProportionateScreenHeight(300),
                            ),
                            itemCount: listOfProduct.length,
                            itemBuilder: (ctx, index) {
                              return ProductItem(
                                productData: listOfProduct[index],
                              );
                            },
                          );
              },
            ),
          ),
        ],
      ),
    );
  }
}
