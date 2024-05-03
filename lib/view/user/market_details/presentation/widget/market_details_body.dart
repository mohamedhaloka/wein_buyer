import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/utils/app_enums.dart';
import 'package:wein_buyer/view/user/market_details/presentation/widget/sections_and_products_widget.dart';
import 'package:wein_buyer/view/user/market_details/presentation/widget/tab_sections_widget.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/controller/product_details_cubit.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import 'header_market_widget.dart';
import 'market_details_widget.dart';

class MarketDetailsBody extends StatelessWidget {
  const MarketDetailsBody({Key? key, required this.marketId}) : super(key: key);

  final int marketId;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          final productDetailsCubit = ProductDetailsCubit.of(context);
          return state is GetMarketDetailsLoading ||
                  productDetailsCubit.marketDetails == null
              ? const LoadingIndicator()
              : Column(
                  children: [
                    const HeaderMarketWidget(),
                    SpaceH(inputHeigth: 10),
                    const TabSectionsWidget(),
                    SpaceH(inputHeigth: 10),
                    productDetailsCubit.tabMarket == TabMarket.marketDetails
                        ? const MarketDetailsWidget()
                        : SectionsAndProductsWidget(
                            marketId: marketId,
                          ),
                  ],
                );
        },
      ),
    );
  }
}
