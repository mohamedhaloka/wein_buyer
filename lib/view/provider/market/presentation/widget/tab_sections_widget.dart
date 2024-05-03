import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_enums.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/provider/market/presentation/controller/market_cubit.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import 'package:wein_buyer/widgets/space_width.dart';

import '../../../../../core/utils/app_strings.dart';

class TabSectionsWidget extends StatelessWidget {
  const TabSectionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketCubit, MarketState>(
      builder: (context, state) {
        final marketCubit = MarketCubit.of(context);
        return Container(
          width: AppSizes.screenWidth,
          color: AppColors.transparntColor51,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.getProportionateScreenHeight(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    marketCubit.changeTabButtons('details');
                    MarketCubit.of(context).getProfileData();
                    MarketCubit.of(context).getMyRates();
                  },
                  child: SizedBox(
                    width: AppSizes.getProportionateScreenWidth(90),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.tabSectionsWidget.translate(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color:
                                marketCubit.tabMarket == TabMarket.marketDetails
                                    ? AppColors.primaryColor
                                    : AppColors.GrayColor161,
                          ),
                        ),
                        SpaceH(inputHeigth: 10),
                        marketCubit.tabMarket == TabMarket.marketDetails
                            ? Container(
                                height:
                                    AppSizes.getProportionateScreenHeight(2),
                                color: AppColors.primaryColor,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
                SpaceW(inputWidth: 20),
                InkWell(
                  onTap: () async{
                    marketCubit.changeTabButtons('products');
                    MarketCubit.of(context).getAllCategories();
                    MarketCubit.of(context).getProducts(0);
                  },
                  child: SizedBox(
                    width: AppSizes.getProportionateScreenWidth(130),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.proudestTabSectionsWidget.translate(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: marketCubit.tabMarket ==
                                    TabMarket.sectionsAndProducts
                                ? AppColors.primaryColor
                                : AppColors.GrayColor161,
                          ),
                        ),
                        SpaceH(inputHeigth: 10),
                        marketCubit.tabMarket == TabMarket.sectionsAndProducts
                            ? Container(
                                height:
                                    AppSizes.getProportionateScreenHeight(2),
                                color: AppColors.primaryColor,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
