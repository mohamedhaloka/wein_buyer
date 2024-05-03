import 'package:flutter/material.dart';
import 'package:wein_buyer/view/user/returns/presentation/widget/return_order_item.dart';
import '../../../../../../../core/utils/app_sizes.dart';

class DoneReturnList extends StatelessWidget {
  const DoneReturnList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getProportionateScreenWidth(20),
        vertical: AppSizes.getProportionateScreenHeight(10),
      ),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ReturnOrderItem();
        },
      ),
    );
  }
}
