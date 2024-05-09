import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/provider/market/presentation/widget/currency_widget.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';

import '../../../../../../widgets/space_height.dart';
import '../controller/market_cubit.dart';
import 'about_us_widget.dart';
import 'our_location_widget.dart';
import 'our_rating_widget.dart';

class MarketDetailsWidget extends StatelessWidget {
  const MarketDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: BlocBuilder<MarketCubit, MarketState>(
          builder: (context, state) {
            return state is GetMyRatesLoading
                ? SizedBox(
                    width: AppSizes.screenWidth,
                    height: AppSizes.screenHeight * 0.5,
                    child: const LoadingIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 65),
                    child: Column(
                      children: [
                        AboutUsWidget(
                          profileModel: MarketCubit.of(context).profileModel!,
                        ),
                        SpaceH(inputHeigth: 10),
                        CurrencyWidget(
                          profileModel: MarketCubit.of(context).profileModel!,
                        ),
                        SpaceH(inputHeigth: 10),
                        OurLocationWidget(
                          profileModel: MarketCubit.of(context).profileModel!,
                        ),
                        SpaceH(inputHeigth: 10),
                        const OurRatingWidget(),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
