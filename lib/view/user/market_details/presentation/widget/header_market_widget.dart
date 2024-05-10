import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import 'package:wein_buyer/widgets/space_width.dart';

import '../../../../../../../widgets/my_painter.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../productDetails/presentation/controller/product_details_cubit.dart';

class HeaderMarketWidget extends StatelessWidget {
  const HeaderMarketWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetailsCubit = ProductDetailsCubit.of(context);
    return SizedBox(
      height: AppSizes.screenHeight * 0.3,
      width: AppSizes.screenWidth,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: productDetailsCubit.marketDetails!.header ?? '',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          PositionedDirectional(
            top: AppSizes.getProportionateScreenHeight(40),
            start: AppSizes.getProportionateScreenWidth(20),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                padding:
                    EdgeInsets.all(AppSizes.getProportionateScreenHeight(5)),
                child: const Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: AppSizes.screenWidth,
              height: AppSizes.screenHeight * 0.2,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        ClipPath(
                          clipper: CustomClip(),
                          child: Container(
                            width: AppSizes.screenWidth,
                            height: AppSizes.screenHeight * 0.15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: AppSizes.screenWidth,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            children: [
                              Container(
                                height:
                                    AppSizes.getProportionateScreenHeight(95),
                                width:
                                    AppSizes.getProportionateScreenHeight(95),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(productDetailsCubit
                                              .marketDetails!.image ??
                                          ''),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              productDetailsCubit.marketDetails!.storeName ??
                                  '',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.fontColor,
                              ),
                            ),
                          ],
                        ),
                        SpaceH(inputHeigth: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: AppSizes.getProportionateScreenWidth(15),
                              height: AppSizes.getProportionateScreenHeight(15),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: productDetailsCubit.marketDetails!.open!
                                    ? const Color.fromRGBO(42, 211, 55, 1)
                                    : Colors.red,
                              ),
                            ),
                            SpaceW(inputWidth: 5),
                            Text(
                              productDetailsCubit.marketDetails!.open!
                                  ? AppStrings.openHeaderMarketWidget
                                      .translate()
                                  : AppStrings.closedHeaderMarketWidget
                                      .translate(),
                              style: TextStyle(
                                color: productDetailsCubit.marketDetails!.open!
                                    ? const Color.fromRGBO(42, 211, 55, 1)
                                    : Colors.red,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
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
        ],
      ),
    );
  }
}
