import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';

import '../../../../../../core/models/orders_model.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../widgets/space_height.dart';
import '../../../../../../widgets/space_width.dart';
import '../../../../../../widgets/tab_widget.dart';

class ReasonForReturnWidget extends StatelessWidget {
  const ReasonForReturnWidget({Key? key, required this.order})
      : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const TabWidget(),
            SpaceW(inputWidth: 15),
            Text(
              order.status == 'rejected'
                  ? '${AppStrings.reasonForReturnWidget.translate()}'
                  : order.status == 'canceled'
                      ? '${AppStrings.regretReasonForReturnWidget.translate()}'
                      : '${AppStrings.ReasonForReturnWidget.translate()}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.fontColor,
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
        SpaceH(inputHeigth: 5),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(20),
          ),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              order.status == 'rejected'
                  ? order.rejectReason??''
                  : order.status == 'canceled'
                      ? order.cancelReason??''
                      : '${AppStrings.ReasonForReturnWidget.translate()}',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
