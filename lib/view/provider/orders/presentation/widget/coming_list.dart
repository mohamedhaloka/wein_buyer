import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/provider/orders/presentation/controller/orders_cubit.dart';
import 'package:wein_buyer/view/provider/utils/presentation/controller/utils_cubit.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/order_item.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../core/utils/app_strings.dart';

class ComingList extends StatefulWidget {
  const ComingList({Key? key}) : super(key: key);

  @override
  State<ComingList> createState() => _ComingListState();
}

class _ComingListState extends State<ComingList> {
  @override
  void initState() {
    OrdersCubit.of(context).getOrders('new');
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
                     AppStrings.cancelledList .translate() ,
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
