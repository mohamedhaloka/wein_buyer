import 'package:flutter/material.dart';
import 'package:wein_buyer/view/user/cart/presentation/widget/payment_method_widget.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import '../../../../../../../core/models/cart_model.dart';
import 'confirmation_order_widget.dart';
import 'delivery_address_widget.dart';
import 'no_delivery_address_widget.dart';

class DeliveryAddressAndPaymentMethodBody extends StatelessWidget {
  const DeliveryAddressAndPaymentMethodBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const DeliveryAddressWidget(),
          SpaceH(inputHeigth: 10),
          const PaymentMethodWidget(),
          SpaceH(inputHeigth: 10),
          const ConfirmationOrderWidget(
          ),
        ],
      ),
    );
  }
}
