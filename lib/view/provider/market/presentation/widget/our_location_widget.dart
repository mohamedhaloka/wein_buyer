import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/profile_provider_model.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/view/provider/market/presentation/controller/market_cubit.dart';
import 'package:wein_buyer/view/provider/market/presentation/screen/location_market_screen.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../widgets/space_width.dart';
import '../../../../../../widgets/tab_widget.dart';
import '../../../../../core/utils/app_strings.dart';

class OurLocationWidget extends StatelessWidget {
  const OurLocationWidget({Key? key, required this.profileModel})
      : super(key: key);

  final Profile profileModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const TabWidget(
              height: 35,
              width: 4,
            ),
            SpaceW(inputWidth: 20),
            Text(
              AppStrings.ourLocationWidget.translate(),
              style: TextStyle(
                color: AppColors.fontColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.edit_outlined,
                color: AppColors.primaryColor,
                size: 18,
              ),
              onPressed: () {
                MarketCubit.of(context).onLocationClick(context);
                // showModalBottomSheet<void>(
                //   context: context,
                //   isDismissible: false,
                //   isScrollControlled: true,
                //   shape: const RoundedRectangleBorder(
                //     borderRadius: BorderRadius.vertical(
                //       top: Radius.circular(25),
                //     ),
                //   ),
                //   builder: (BuildContext context) {
                //     return const EditMarketDetailsBottomSheet();
                //   },
                // );
              },
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 18,
                  ),
                  Expanded(
                    child: Text(
                      profileModel.user!.address ?? '',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.sp,
                      ),
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
                      AppAssets.mapImg,
                      width: AppSizes.screenWidth,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          double lat =
                              double.parse(profileModel.user!.lat ?? '0.0');
                          double lng =
                              double.parse(profileModel.user!.lng ?? '0.0');
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
