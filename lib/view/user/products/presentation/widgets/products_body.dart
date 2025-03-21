import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/products/presentation/controller/products_cubit.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/product_item.dart';

import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';

class ProductsBody extends StatelessWidget {
  const ProductsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(15),
      ),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is GetProductsLoaded) {
            if (ProductsCubit.of(context).listOfProducts.isNotEmpty) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: AppSizes.getProportionateScreenHeight(252),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.getProportionateScreenWidth(25),
                ),
                itemCount: ProductsCubit.of(context).listOfProducts.length,
                itemBuilder: (BuildContext ctx, index) {
                  return ProductItem(
                    product: ProductsCubit.of(context).listOfProducts[index],
                  );
                },
              );
            } else {
              return Center(
                child: Text(AppStrings.noProtects.translate()),
              );
            }
          } else {
            return const LoadingIndicator();
          }
        },
      ),
    );
  }
}
