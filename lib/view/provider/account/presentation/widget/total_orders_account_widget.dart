import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/provider/market/presentation/controller/market_cubit.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';

class TotalOrdersAccountWidget extends StatelessWidget {
  const TotalOrdersAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketCubit, MarketState>(
      builder: (context, state) {
        return state is GetProfileDataLoading
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppSizes.getProportionateScreenHeight(10),
                  horizontal: AppSizes.getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(70, 160, 239, 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.getProportionateScreenHeight(15),
                          horizontal: AppSizes.getProportionateScreenWidth(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.orderNumber.translate(),
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                            Text(
                              (MarketCubit.of(context)
                                          .profileModel!
                                          .orders!
                                          .totalOrders ??
                                      '0')
                                  .toString(),
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(42, 211, 55, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SpaceH(inputHeigth: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(48, 108, 227, 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.getProportionateScreenHeight(20),
                          horizontal: AppSizes.getProportionateScreenWidth(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.costOrderCash.translate(),
                                  style: TextStyle(
                                    color: AppColors.fontColor,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      (MarketCubit.of(context)
                                                  .profileModel!
                                                  .orders!
                                                  .cashOrdersCost ??
                                              '0')
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromRGBO(
                                            48, 108, 227, 1),
                                      ),
                                    ),
                                    Text(
                                      MarketCubit.of(context)
                                              .profileModel!
                                              .user!
                                              .currency!
                                              .name ??
                                          '',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromRGBO(
                                            48, 108, 227, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SpaceH(inputHeigth: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.costOrderOnline.translate(),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.fontColor,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      (MarketCubit.of(context)
                                                  .profileModel!
                                                  .orders!
                                                  .onlineOrdersCost ??
                                              '0')
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromRGBO(
                                            48, 108, 227, 1),
                                      ),
                                    ),
                                    Text(
                                      MarketCubit.of(context)
                                          .profileModel!
                                          .user!
                                          .currency!
                                          .name ??
                                          '',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromRGBO(
                                            48, 108, 227, 1),
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
                ),
              );
      },
    );
  }
}
