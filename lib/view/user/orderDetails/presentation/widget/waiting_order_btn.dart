import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/user/orderDetails/presentation/controller/order_details_cubit.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import 'package:wein_buyer/widgets/space_width.dart';

import '../../../../../../../core/models/orders_model.dart';
import '../../../../../core/utils/app_strings.dart';

class WaitingOrderBTN extends StatelessWidget {
  const WaitingOrderBTN({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppSizes.screenWidth * 0.8,
        height: AppSizes.getProportionateScreenHeight(50),
        child: CustomButton(
          text: AppStrings.cancelOrder.translate(),
          fontColor: AppColors.primaryColor,
          buttonColor: AppColors.primaryColor.withOpacity(0.2),
          onPress: () {
            showDialog(
              context: context,
              builder: (conxt) {
                return BlocProvider.value(
                  value: OrderDetailsUserCubit.of(context),
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      height: AppSizes.screenHeight * 0.25,
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizes.getProportionateScreenHeight(30),
                        horizontal: AppSizes.getProportionateScreenWidth(15),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                AppStrings.cancelOrder.translate(),
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.fontColor,
                                ),
                              ),
                              SpaceH(inputHeigth: 20),
                              Text(
                                AppStrings.areSureCansel.translate(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.fontColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: BlocBuilder<OrderDetailsUserCubit, OrderDetailsUserState>(
                                  builder: (context, state) {
                                    return state is CancelOrderUserLoading ? const LoadingIndicator() : CustomButton(
                                      text: AppStrings.cancelOrder.translate(),
                                      paddingVertical: 12,
                                      onPress: () {
                                        OrderDetailsUserCubit.of(context)
                                            .cancelOrderUser(order.id!);
                                      },
                                    );
                                  },
                                ),
                              ),
                              SpaceW(inputWidth: 10),
                              Expanded(
                                flex: 1,
                                child: CustomButton(
                                  text: AppStrings.shutDown.translate(),
                                  fontColor: AppColors.GrayColor112,
                                  borderColor: AppColors.GrayColor112,
                                  buttonColor: Colors.white,
                                  paddingVertical: 12,
                                  onPress: () {
                                    MagicRouter.pop();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
