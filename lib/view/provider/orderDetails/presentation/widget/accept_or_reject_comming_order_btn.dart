import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/provider/orderDetails/presentation/controller/order_details_cubit.dart';
import 'package:wein_buyer/view/provider/orderDetails/presentation/widget/reason_reject_bottom_sheet.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';

import '../../../../../../core/models/orders_model.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../widgets/custom_button.dart';
import '../../../../../../widgets/space_width.dart';

class AcceptOrRejectCommingOrderBTN extends StatelessWidget {
  const AcceptOrRejectCommingOrderBTN({Key? key, required this.order})
      : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: AppSizes.getProportionateScreenWidth(120),
          child: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
            builder: (context, state) {
              return state is AcceptOrderLoading
                  ? const LoadingIndicator()
                  : CustomButton(
                      text: AppStrings.acceptOrRejectCommingOrderBTN.translate(),
                      paddingVertical:
                          AppSizes.getProportionateScreenHeight(15),
                      onPress: () {
                        OrderDetailsCubit.of(context).acceptOrder(order.id!);
                      },
                    );
            },
          ),
        ),
        SpaceW(inputWidth: 10),
        SizedBox(
          width: AppSizes.getProportionateScreenWidth(120),
          child: CustomButton(
            text: AppStrings.regretOrRejectCommingOrderBTN.translate(),
            paddingVertical: AppSizes.getProportionateScreenHeight(15),
            fontColor: AppColors.primaryColor,
            buttonColor: AppColors.primaryColor.withOpacity(0.1),
            onPress: () {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                builder: (BuildContext conxt) {
                  return BlocProvider.value(
                    value: OrderDetailsCubit.of(context),
                    child: ReasonRejectBottomSheet(
                      orderId: order.id!,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
