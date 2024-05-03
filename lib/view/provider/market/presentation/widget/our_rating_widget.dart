import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/provider/market/presentation/controller/market_cubit.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../widgets/space_width.dart';
import '../../../../../../widgets/tab_widget.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../widgets/loading_indicator.dart';

class OurRatingWidget extends StatelessWidget {
  const OurRatingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const TabWidget(),
            SpaceW(inputWidth: 20),
            Text(
              AppStrings.ourRatingWidget.translate(),
              style: TextStyle(
                color: AppColors.fontColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        BlocBuilder<MarketCubit, MarketState>(
          builder: (context, state) {
            return  MarketCubit.of(context)
                .myRatesModel != null ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.getProportionateScreenWidth(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: AppSizes.getProportionateScreenWidth(85),
                        height: AppSizes.getProportionateScreenWidth(85),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 229, 48, 1)
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          MarketCubit.of(context)
                                      .myRatesModel
                                      ?.body!
                                      .total
                                      .toString() ==
                                  '0.0'
                              ? '0'
                              : MarketCubit.of(context)
                                  .myRatesModel!
                                  .body!
                                  .total
                                  .toString(),
                          style: TextStyle(
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(255, 229, 48, 1),
                          ),
                        ),
                      ),
                      RatingBarIndicator(
                        rating: MarketCubit.of(context)
                                .myRatesModel
                                ?.body!
                                .total!
                                .toDouble() ??
                            0,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 16.sp,
                        direction: Axis.horizontal,
                      ),
                      Text(
                        '(${MarketCubit.of(context).listOfrates.length})',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      MarketCubit.of(context).listOfrates.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.getProportionateScreenHeight(3),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "${MarketCubit.of(context).listOfrates[index].rate}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(
                              Icons.star,
                              color: Color.fromRGBO(255, 229, 48, 1),
                            ),
                            SpaceW(inputWidth: 10),
                            SizedBox(
                              width: AppSizes.screenWidth * 0.35,
                              child: LinearProgressIndicator(
                                value: MarketCubit.of(context)
                                        .listOfrates[index]
                                        .numberOfRates!
                                        .toDouble() /
                                    10,
                                backgroundColor:
                                    const Color.fromRGBO(239, 238, 238, 1),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color.fromRGBO(255, 229, 48, 1),
                                ),
                              ),
                            ),
                            SpaceW(inputWidth: 10),
                            Text(
                              '(${MarketCubit.of(context).listOfrates[index].numberOfRates})',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ) : const LoadingIndicator();
          },
        ),
      ],
    );
  }
}
