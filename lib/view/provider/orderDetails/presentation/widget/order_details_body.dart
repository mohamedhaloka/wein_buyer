import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/provider/orderDetails/presentation/widget/reason_for_return_widget.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../core/models/orders_model.dart';
import 'accept_or_reject_comming_order_btn.dart';
import 'accept_or_reject_ongoing_order_btn.dart';
import 'accept_or_reject_return_order_btn.dart';
import 'address_order_widget.dart';
import 'cost_order_widget.dart';
import 'details_order_widget.dart';

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
            order.status == 'rejected' || order.status == 'canceled'
                ? ReasonForReturnWidget(
                    order: order,
                  )
                : const SizedBox(),
            SpaceH(inputHeigth: 5),
            AddressOrderWidget(
              order: order,
            ),
            SpaceH(inputHeigth: 5),
            DetailsOrderWidget(
              order: order,
            ),
            CostOrderWidget(
              order: order,
            ),
            SpaceH(inputHeigth: 5),
            order.status == 'new'
                ? AcceptOrRejectCommingOrderBTN(
                    order: order,
                  )
                : order.status == 'in_progress'
                    ? AcceptOrRejectOngoingOrderBTN(
                        order: order,
                      )
                    : const SizedBox(),
            // AcceptOrRejectReturnOrderBTN(),
          ],
        ),
      ),
    );
  }
}
