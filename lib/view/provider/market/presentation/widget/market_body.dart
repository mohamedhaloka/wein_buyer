import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/utils/app_enums.dart';
import 'package:wein_buyer/view/provider/market/presentation/widget/sections_and_products_widget.dart';
import 'package:wein_buyer/view/provider/market/presentation/widget/tab_sections_widget.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../controller/market_cubit.dart';
import 'header_market_widget.dart';
import 'market_details_widget.dart';

class MarketBody extends StatelessWidget {
  const MarketBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BlocBuilder<MarketCubit, MarketState>(
        builder: (context, state) {
          final marketCubit = MarketCubit.of(context);

          return MarketCubit.of(context).profileModel == null
              ? const LoadingIndicator()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeaderMarketWidget(),
                    const TabSectionsWidget(),
                    SpaceH(inputHeigth: 10),
                    marketCubit.tabMarket == TabMarket.marketDetails
                        ? const MarketDetailsWidget()
                        : const SectionsAndProductsWidget(),
                  ],
                );
        },
      ),
    );
  }
}
