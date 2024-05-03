import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/provider/orderDetails/presentation/controller/order_details_cubit.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import 'package:wein_buyer/widgets/input_form_field.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../widgets/loading_indicator.dart';

class ReasonRejectBottomSheet extends StatelessWidget {
  const ReasonRejectBottomSheet({Key? key, required this.orderId})
      : super(key: key);

  final int orderId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: AppSizes.screenHeight * 0.37,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.getProportionateScreenHeight(20),
            horizontal: AppSizes.getProportionateScreenWidth(25),
          ),
          child: Column(
            children: [
              Text(
                AppStrings.reasonForReturnWidget.translate(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpaceH(inputHeigth: 15),
              SizedBox(
                width: AppSizes.screenWidth,
                child: Text(
                  AppStrings.chooseReasonCancelBottomSheet.translate(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SpaceH(inputHeigth: 10),
              InputFormField(
                hint: '${AppStrings.reasonRejectBottomSheet.translate()}',
                multiLine: true,
                maxLines: 3,
                controller:
                    OrderDetailsCubit.of(context).rejectReasonController,
                validator: (String) {},
              ),
              SpaceH(inputHeigth: 10),
              BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
                builder: (context, state) {
                  return state is RejectOrderLoading
                      ? const LoadingIndicator()
                      :  CustomButton(
                    text: '${AppStrings.send.translate()}',
                    paddingVertical: AppSizes.getProportionateScreenHeight(15),
                    onPress: () {
                      OrderDetailsCubit.of(context).rejectOrder(
                          orderId,
                          OrderDetailsCubit.of(context)
                              .rejectReasonController
                              .text);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
