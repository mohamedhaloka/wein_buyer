import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';

import '../../../../../../core/models/orders_model.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../widgets/space_height.dart';
import '../../../../../../widgets/space_width.dart';
import '../../../../../../widgets/tab_widget.dart';
import '../../../../../core/utils/app_strings.dart';

class AddressOrderWidget extends StatelessWidget {
  const AddressOrderWidget({Key? key, required this.order}) : super(key: key);

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
              AppStrings.addressOrderWidget.translate(),
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
              color: AppColors.transparntColor51,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.GrayColor239,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.clientName ?? '',
                    style: TextStyle(
                      color: AppColors.fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  SpaceH(inputHeigth: 5),
                  Text(
                    order.address!.phone ?? '',
                    style: TextStyle(
                      color: AppColors.fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                  SpaceH(inputHeigth: 5),
                  Text(
                    order.address!.address ?? '',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.GrayColor112,
                    ),
                  ),
                  SpaceH(inputHeigth: 10),
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.flag,
                      ),
                      SpaceW(inputWidth: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.nearAddressOrderWidget.translate(),
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.GrayColor161,
                            ),
                          ),
                          Text(
                            order.address!.nearestAddress ?? '',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.fontColor,
                            ),
                          ),
                        ],
                      ),
                    ],
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
