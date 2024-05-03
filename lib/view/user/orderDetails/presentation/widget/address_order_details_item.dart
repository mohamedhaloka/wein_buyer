import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';

import '../../../../../../../core/models/orders_model.dart';
import '../../../../../../../core/utils/app_assets.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../../../widgets/tab_widget.dart';
import '../../../../../core/utils/app_strings.dart';

class AddressOrderDetailsItem extends StatelessWidget {
  const AddressOrderDetailsItem({Key? key, required this.order}) : super(key: key);

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
              AppStrings.deliveryTo.translate(),
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
              color: AppColors.transparntColor255,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.GrayColor239,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getProportionateScreenWidth(10),
              vertical: AppSizes.getProportionateScreenHeight(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.address!.recipientName??'',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.fontColor,
                  ),
                ),
                Text(
                  order.address!.phone??'',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.fontColor,
                  ),
                ),
                SpaceH(inputHeigth: 10),
                Text(
                  order.address!.address??'',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.GrayColor112,
                  ),
                ),
                SpaceH(inputHeigth: 10),
                Row(
                  children: [
                    SizedBox(
                      height: AppSizes.getProportionateScreenHeight(20),
                      child: Image.asset(
                        AppAssets.flag,
                      ),
                    ),
                    SpaceW(
                      inputWidth: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.nearestAddress.translate(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.GrayColor161,
                          ),
                        ),
                        Text(
                          order.address!.nearestAddress??'',
                          style: TextStyle(
                            fontSize: 14.sp,
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
      ],
    );
  }
}
