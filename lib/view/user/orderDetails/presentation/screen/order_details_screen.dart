import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/myOrders/presentation/controller/my_orders_cubit.dart';
import 'package:wein_buyer/view/user/orderDetails/presentation/controller/order_details_cubit.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';

import '../../../../../../../core/models/orders_model.dart';
import '../../../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/order_details_body.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyOrdersCubit(sl(), sl()),
        ),
        BlocProvider(
          create: (context) => OrderDetailsUserCubit(sl()),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.detailsOrderWidget.translate(),
        ),
        body: OrderDetailsBody(
          order: order,
        ),
      ),
    );
  }
}
