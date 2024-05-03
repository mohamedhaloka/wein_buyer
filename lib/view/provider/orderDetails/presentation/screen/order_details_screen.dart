import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/orders_model.dart';
import 'package:wein_buyer/view/provider/orderDetails/presentation/controller/order_details_cubit.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';

import '../../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/order_details_body.dart';

class OrderDetailsProviderScreen extends StatelessWidget {
  const OrderDetailsProviderScreen({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDetailsCubit(sl(), sl(), sl() , sl()),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.orderDetailsScreen.translate(),
        ),
        body: OrderDetailsBody(
          order: order,
        ),
      ),
    );
  }
}
