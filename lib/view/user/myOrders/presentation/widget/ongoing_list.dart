import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';

import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/order_item.dart';
import '../../../../../core/utils/app_strings.dart';
import '../controller/my_orders_cubit.dart';

class OngoingList extends StatefulWidget {
  const OngoingList({Key? key}) : super(key: key);

  @override
  State<OngoingList> createState() => _OngoingListState();
}

class _OngoingListState extends State<OngoingList> {

  @override
  void initState() {
    MyOrdersCubit.of(context).getMyOrders('in_progress');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getProportionateScreenWidth(20),
        vertical: AppSizes.getProportionateScreenHeight(10),
      ),
      child: BlocBuilder<MyOrdersCubit, MyOrdersState>(
        builder: (context, state) {
          if(state is GetMyOrdersLoaded){
            if(MyOrdersCubit.of(context).listOfOrders.isNotEmpty){
              return ListView.builder(
                itemCount: MyOrdersCubit.of(context).listOfOrders.length,
                itemBuilder: (context, index) {
                  return OrderItem(
                    isProvider: false,
                    order: MyOrdersCubit.of(context).listOfOrders[index],
                  );
                },
              );
            }else{
              return  Center(
                child: Text(AppStrings.noOrders.translate()),
              );
            }
          }else{
            return const LoadingIndicator();
          }
        },
      ),
    );
  }
}
