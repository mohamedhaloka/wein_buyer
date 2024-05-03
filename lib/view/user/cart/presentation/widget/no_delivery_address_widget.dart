import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/user/addresses/presentation/screen/addresses_screen.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../../../widgets/tab_widget.dart';
import '../../../../../core/utils/app_strings.dart';

class NoDeliveryAddressWidget extends StatelessWidget {
  const NoDeliveryAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TabWidget(),
            SpaceW(inputWidth: 10),
            Text(
              AppStrings.deliveryCostTitle.translate(),
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.fontColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SpaceH(inputHeigth: 10),
        Container(
          width: AppSizes.screenWidth * 0.85,
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.getProportionateScreenHeight(30),
          ),
          decoration: BoxDecoration(
            color: AppColors.GrayColor239,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.transparntColor255,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.address_img),
              SpaceH(inputHeigth: 10),
              Text(
                AppStrings.noDeliveryAddressWidget.translate(),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.fontColor,
                ),
              ),
              TextButton(
                child: Text(
                  AppStrings.addressesScreen.translate(),
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  MagicRouter.navigateTo(const AddressesScreen());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
