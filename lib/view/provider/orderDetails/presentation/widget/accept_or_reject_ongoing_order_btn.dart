import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/provider/orderDetails/presentation/controller/order_details_cubit.dart';
import 'package:wein_buyer/view/provider/orderDetails/presentation/widget/reason_cancel_bottom_sheet.dart';
import 'package:wein_buyer/view/provider/orderDetails/presentation/widget/received_amount_bottom_sheet.dart';

import '../../../../../../core/models/orders_model.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../widgets/custom_button.dart';
import '../../../../../../widgets/loading_indicator.dart';
import '../../../../../../widgets/space_width.dart';
import '../../../../../core/utils/app_strings.dart';

class AcceptOrRejectOngoingOrderBTN extends StatelessWidget {
  const AcceptOrRejectOngoingOrderBTN({Key? key, required this.order})
      : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: AppSizes.getProportionateScreenWidth(120),
          height: AppSizes.getProportionateScreenHeight(50),
          child: order.paymentMethod == 'cash'
              ? CustomButton(
                  text: AppStrings.acceptOrRejectOngoingOrderBTN.translate(),
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
                          child: ReceivedAmountBottomSheet(
                            orderId: order.id!,
                          ),
                        );
                      },
                    );
                  },
                )
              : BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
                  builder: (context, state) {
                    return state is DeliverOrderLoading
                        ? const LoadingIndicator()
                        : CustomButton(
                            text: AppStrings.sendAcceptOrRejectOngoingOrderBTN.translate(),
                            paddingVertical:
                                AppSizes.getProportionateScreenHeight(15),
                            onPress: () {
                              OrderDetailsCubit.of(context).deliverOrder(
                                  context,
                                  order.id!,
                                  OrderDetailsCubit.of(context)
                                      .pricePaidController
                                      .text);
                            },
                          );
                  },
                ),
        ),
        SpaceW(inputWidth: 10),
        SizedBox(
          width: AppSizes.getProportionateScreenWidth(120),
          height: AppSizes.getProportionateScreenHeight(50),
          child: CustomButton(
            text: AppStrings.deleteAcceptOrRejectOngoingOrderBTN.translate(),
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
                    child: ReasonCancelBottomSheet(
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
