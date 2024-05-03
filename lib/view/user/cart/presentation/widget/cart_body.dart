import 'package:flutter/material.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/view/user/cart/presentation/widget/list_of_cart_widget.dart';
import 'package:wein_buyer/view/user/cart/presentation/widget/total_price_cart_widget.dart';

import '../../../../../../../widgets/visitor_screen.dart';

class CartBody extends StatelessWidget {
  CartBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppStorage.isLogged ? Column(
      children: const [
        ListOfCartWidget(),
        TotalPriceCartWidget(),
      ],
    ) : VisitorScreen();
  }
}
