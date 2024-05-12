import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/controller/product_details_cubit.dart';

import '../../../../../../../core/services/services_locator.dart';
import '../widget/market_details_body.dart';

class MarketDetailsScreen extends StatelessWidget {
  const MarketDetailsScreen({Key? key, required this.marketId})
      : super(key: key);

  final int marketId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDetailsCubit(sl(), sl(), sl(), sl(), sl(), sl())
            ..getMarketDetails(marketId)
            ..getMarketCategories(marketId)
            ..getMarketProducts(0, marketId, 0),
      child: Scaffold(
        body: MarketDetailsBody(
          marketId: marketId,
        ),
      ),
    );
  }
}
