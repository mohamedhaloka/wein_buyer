import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/user/orderDetails/presentation/controller/order_details_cubit.dart';
import 'package:wein_buyer/view/user/orderDetails/presentation/widget/address_order_details_item.dart';
import 'package:wein_buyer/view/user/orderDetails/presentation/widget/details_order_widget.dart';
import 'package:wein_buyer/view/user/orderDetails/presentation/widget/waiting_order_btn.dart';

import '../../../../../../../core/models/orders_model.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_height.dart';
import 'cost_order_widget.dart';
import 'ended_order_btn.dart';
import 'market_order_details_widget.dart';

class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.getProportionateScreenHeight(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MarketOrderDetailsWidget(
              order: order,
            ),
            SpaceH(inputHeigth: 10),
            AddressOrderDetailsItem(
              order: order,
            ),
            SpaceH(inputHeigth: 10),
            DetailsOrderWidget(
              order: order,
            ),
            SpaceH(inputHeigth: 10),
            CostOrderWidget(
              order: order,
            ),
            SpaceH(inputHeigth: 10),
            order.status == 'new'
                ? WaitingOrderBTN(
                  order: order,
                )
                // : order.status == 'finished'
                //     ? EndedOrderBTN(
                //         order: order,
                //       )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
