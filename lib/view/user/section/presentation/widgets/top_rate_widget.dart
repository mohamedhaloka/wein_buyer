import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/view/user/products/presentation/screen/products_screen.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../../core/models/product.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/product_item.dart';
import '../../../../../core/utils/app_strings.dart';
import '../controller/section_cubit.dart';

class TopRateWidget extends StatelessWidget {
  const TopRateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(15),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.topRateWidget.translate(),
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                  // TextButton(
                  //   child: Text(
                  //     AppStrings.seeAll.translate(),
                  //     style: TextStyle(
                  //       color: AppColors.primaryColor,
                  //       fontSize: 12.sp,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     MagicRouter.navigateTo(
                  //       const ProductsScreen(
                  //         subCateId: 0,
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
              SpaceH(
                inputHeigth: AppSizes.getProportionateScreenHeight(10),
              ),
              BlocBuilder<SectionCubit, SectionState>(
                builder: (context, state) {
                  if (state is GetSubCatesLoaded) {
                    if (SectionCubit.of(context)
                        .listOfTopRatedProducts
                        .isNotEmpty) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent:
                              AppSizes.getProportionateScreenHeight(270),
                        ),
                        itemCount: SectionCubit.of(context)
                            .listOfTopRatedProducts
                            .length,
                        itemBuilder: (BuildContext ctx, index) {
                          return ProductItem(
                            product: SectionCubit.of(context)
                                .listOfTopRatedProducts[index],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(AppStrings.noProtects.translate()),
                      );
                    }
                  } else {
                    return const LoadingIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
