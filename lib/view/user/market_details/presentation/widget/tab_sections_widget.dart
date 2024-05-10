import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_enums.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import 'package:wein_buyer/widgets/space_width.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../productDetails/presentation/controller/product_details_cubit.dart';

class TabSectionsWidget extends StatelessWidget {
  const TabSectionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        final productDetailsCubit = ProductDetailsCubit.of(context);
        return Container(
          width: AppSizes.screenWidth,
          color: const Color.fromRGBO(251, 251, 251, 1),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.getProportionateScreenHeight(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    productDetailsCubit.changeTabButtons('details');
                  },
                  child: SizedBox(
                    width: AppSizes.getProportionateScreenWidth(130),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.dataFromStore.translate(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: productDetailsCubit.tabMarket ==
                                    TabMarket.marketDetails
                                ? AppColors.primaryColor
                                : AppColors.GrayColor161,
                          ),
                        ),
                        SpaceH(inputHeigth: 10),
                        productDetailsCubit.tabMarket == TabMarket.marketDetails
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
                  onTap: () {
                    productDetailsCubit.changeTabButtons('products');
                  },
                  child: SizedBox(
                    width: AppSizes.getProportionateScreenWidth(130),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.proudestTabSectionsWidget.translate(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: productDetailsCubit.tabMarket ==
                                    TabMarket.sectionsAndProducts
                                ? AppColors.primaryColor
                                : AppColors.GrayColor161,
                          ),
                        ),
                        SpaceH(inputHeigth: 10),
                        productDetailsCubit.tabMarket ==
                                TabMarket.sectionsAndProducts
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
