import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../../core/router/router.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../../../widgets/tab_widget.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../productDetails/presentation/controller/product_details_cubit.dart';
import '../screen/location_market_screen.dart';

class OurLocationWidget extends StatelessWidget {
  const OurLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const TabWidget(),
            SpaceW(inputWidth: 20),
            Text(
              AppStrings.ourLocationWidget.translate(),
              style: TextStyle(
                color: AppColors.fontColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(20),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                  Text(
                    AppStrings.howEverLocation.translate(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    '${ProductDetailsCubit.of(context).marketDetails!.distance} ${AppStrings.howMuch.translate()}',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SpaceH(inputHeigth: 10),
              SizedBox(
                width: AppSizes.screenWidth,
                height: AppSizes.getProportionateScreenHeight(170),
                child: Stack(
                  children: [
                    Image.asset(
                      AppAssets.map_img,
                      width: AppSizes.screenWidth,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          double lat = double.parse(
                              ProductDetailsCubit.of(context)
                                      .marketDetails!
                                      .lat ??
                                  '0.0');
                          double lng = double.parse(
                              ProductDetailsCubit.of(context)
                                      .marketDetails!
                                      .lng ??
                                  '0.0');
                          MagicRouter.navigateTo(
                              LocationMarketScreen(lat: lat, lng: lng));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: AppSizes.getProportionateScreenHeight(10),
                            horizontal:
                                AppSizes.getProportionateScreenWidth(20),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          child: Text(
                             AppStrings.showOurLocationWidget.translate(),
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
