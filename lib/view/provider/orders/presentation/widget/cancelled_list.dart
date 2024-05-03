import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/widgets/order_item.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../widgets/loading_indicator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../controller/orders_cubit.dart';

class CancelledList extends StatefulWidget {
  const CancelledList({Key? key}) : super(key: key);

  @override
  State<CancelledList> createState() => _CancelledListState();
}

class _CancelledListState extends State<CancelledList> {
  @override
  void initState() {
    OrdersCubit.of(context).getOrders('canceled');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getProportionateScreenWidth(20),
        vertical: AppSizes.getProportionateScreenHeight(10),
      ),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  Text(
                    AppStrings.cancelledList.translate(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    "${OrdersCubit.of(context).listOfOrders.length}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              SpaceH(inputHeigth: 10),
              Expanded(
                child: state is GetOrdersLoading
                    ? const LoadingIndicator()
                    : OrdersCubit.of(context).listOfOrders.isEmpty
                        ?  Center(child: Text(AppStrings.emptyCancelledList.translate()))
                        : ListView.builder(
                            itemCount:
                                OrdersCubit.of(context).listOfOrders.length,
                            itemBuilder: (context, index) {
                              return OrderItem(
                                isProvider: true,
                                order:
                                    OrdersCubit.of(context).listOfOrders[index],
                              );
                            },
                          ),
              ),
            ],
          );
        },
      ),
    );
  }
}
