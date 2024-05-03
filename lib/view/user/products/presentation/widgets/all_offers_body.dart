import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/products/presentation/controller/products_cubit.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/product_item.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';

class AllOffersBody extends StatelessWidget {
  const AllOffersBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(15),
      ),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is GetAllOffersLoaded) {
            if (ProductsCubit.of(context).listOfOffers.isNotEmpty) {
              return GridView.builder(
                controller: ProductsCubit.of(context).scrollControllerOffer
                  ..addListener(() {
                    if (ProductsCubit.of(context)
                            .scrollControllerOffer
                            .position
                            .pixels ==
                        (ProductsCubit.of(context)
                                .scrollControllerOffer
                                .position
                                .maxScrollExtent) -
                            50) {
                      ProductsCubit.of(context)
                          .getAllOffers(firstFetch: false);
                    }
                  }),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: AppSizes.getProportionateScreenHeight(270),
                ),
                itemCount: ProductsCubit.of(context).listOfOffers.length,
                itemBuilder: (BuildContext ctx, index) {
                  return ProductItem(
                    product: ProductsCubit.of(context).listOfOffers[index],
                  );
                },
              );
            } else {
              return  Center(
                child: Text(AppStrings.noOffers.translate()),
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
