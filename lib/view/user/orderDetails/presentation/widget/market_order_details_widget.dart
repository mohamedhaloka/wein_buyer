import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';

import '../../../../../../../core/models/orders_model.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../../../widgets/tab_widget.dart';
import '../../../../../core/utils/app_strings.dart';
import 'bottom_sheet_show_reason_rejected_widget.dart';

class MarketOrderDetailsWidget extends StatelessWidget {
  const MarketOrderDetailsWidget({Key? key, required this.order})
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
              AppStrings.storeAddress.translate(),
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
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppColors.GrayColor239,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CachedNetworkImage(imageUrl: order.merchant!.logo ?? '',),
                  ),
                  SpaceW(inputWidth: 20),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.merchant!.name ?? '',
                          style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SpaceH(inputHeigth: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(
                                AppSizes.getProportionateScreenHeight(10),
                              ),
                              decoration: BoxDecoration(
                                color: order.status == 'new'
                                    ? const Color.fromRGBO(255, 229, 48, 0.1)
                                    : order.status == 'in_progress'
                                        ? const Color.fromRGBO(
                                            48, 108, 227, 0.1)
                                        : order.status == 'canceled'
                                            ? const Color.fromRGBO(
                                                42, 211, 55, 0.1)
                                            : order.status == 'rejected'
                                                ? const Color.fromRGBO(
                                                    233, 33, 33, 0.1)
                                                : const Color.fromRGBO(
                                                    255, 229, 48, 0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                order.statusText ?? '',
                                style: TextStyle(
                                  color: order.status == 'new'
                                      ? const Color.fromRGBO(255, 229, 48, 1)
                                      : order.status == 'in_progress'
                                          ? const Color.fromRGBO(
                                              48, 108, 227, 1)
                                          : order.status == 'canceled'
                                              ? const Color.fromRGBO(
                                                  42, 211, 55, 1)
                                              : order.status == 'rejected'
                                                  ? const Color.fromRGBO(
                                                      233, 33, 33, 1)
                                                  : const Color.fromRGBO(
                                                      255, 229, 48, 1),
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            order.status == 'rejected'
                                ? InkWell(
                                    onTap: () {
                                      showModalBottomSheet<void>(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(25),
                                          ),
                                        ),
                                        builder: (BuildContext context) {
                                          return BottomSheetShowReasonRejectedWidget(
                                            text: order.rejectReason ?? '',
                                          );
                                        },
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                        AppSizes.getProportionateScreenWidth(
                                            10),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            AppStrings.showResion.translate(),
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SpaceW(inputWidth: 5),
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: AppColors.primaryColor,
                                            size: 18.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : order.status == 'canceled'
                                    ? InkWell(
                                        onTap: () {
                                          showModalBottomSheet<void>(
                                            context: context,
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(25),
                                              ),
                                            ),
                                            builder: (BuildContext context) {
                                              return BottomSheetShowReasonRejectedWidget(
                                                text: order.cancelReason ?? '',
                                              );
                                            },
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                            AppSizes
                                                .getProportionateScreenWidth(
                                                    10),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                AppStrings.showResion.translate(),
                                                style: TextStyle(
                                                  color: AppColors.primaryColor,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SpaceW(inputWidth: 5),
                                              Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: AppColors.primaryColor,
                                                size: 18.sp,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.code,
                                  color: AppColors.GrayColor239,
                                ),
                                SpaceW(inputWidth: 5),
                                Text(
                                  '#${order.id}',
                                  style: TextStyle(
                                    color: AppColors.GrayColor161,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.date_range,
                                  color: AppColors.GrayColor239,
                                ),
                                SpaceW(inputWidth: 5),
                                Text(
                                  DateFormat.yMMMd().format(
                                      DateTime.parse(order.createdAt ?? '')),
                                  style: TextStyle(
                                    color: AppColors.GrayColor161,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
