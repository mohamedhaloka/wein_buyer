import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/addresses_model.dart';

import '../../../../../../../core/utils/app_assets.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../addresses/presentation/controller/addresses_cubit.dart';

class AddressHomeItem extends StatelessWidget {
  const AddressHomeItem({Key? key, required this.address})
      : super(key: key);

  final Address address;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AddressesCubit.of(context).onSelectedAddressItemDefault(address.id!);
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.getProportionateScreenHeight(5),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: address.isDefault!
                    ? AppColors.primaryLightColor
                    : AppColors.transparntColor255,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: address.isDefault!
                      ? AppColors.primaryColor
                      : AppColors.GrayColor239,
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
                    address.recipientName ?? '',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.fontColor,
                    ),
                  ),
                  Text(
                    address.phone ?? '',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.fontColor,
                    ),
                  ),
                  SpaceH(inputHeigth: 10),
                  Text(
                    address.address ?? '',
                    maxLines: 2,
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
                            address.nearestAddress ?? '',
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
          address.isDefault!
              ? Positioned(
                  bottom: 15,
                  left: 10,
                  child: Image.asset(AppAssets.selected_icon),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
