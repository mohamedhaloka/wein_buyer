import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/controller/product_details_cubit.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';

import '../../../../../../../widgets/space_height.dart';
import 'about_us_widget.dart';
import 'our_location_widget.dart';
import 'our_rating_widget.dart';

class MarketDetailsWidget extends StatelessWidget {
  const MarketDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          return state is GetMarketDetailsLoading
              ? const LoadingIndicator()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const AboutUsWidget(),
                      SpaceH(inputHeigth: 10),
                      const OurLocationWidget(),
                      SpaceH(inputHeigth: 10),
                      const OurRatingWidget(),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
