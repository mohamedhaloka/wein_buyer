import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/user/products/presentation/controller/products_cubit.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../core/utils/app_strings.dart';

class BottomSheetSortByWidget extends StatelessWidget {
  const BottomSheetSortByWidget({Key? key, required this.subCateId})
      : super(key: key);

  final int subCateId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.screenHeight * 0.48,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              MagicRouter.pop();
            },
            child: Image.asset(AppAssets.exit_icon),
          ),
          SpaceH(inputHeigth: 15),
          Expanded(
            child: Container(
              width: AppSizes.screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.getProportionateScreenWidth(25),
                vertical: AppSizes.getProportionateScreenHeight(20),
              ),
              child: Column(
                children: [
                  Text(
                    AppStrings.bottomSheetSortByWidget.translate(),
                    style: TextStyle(
                      color: AppColors.fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  SpaceH(inputHeigth: 20),
                  Expanded(
                    child: BlocBuilder<ProductsCubit, ProductsState>(
                      builder: (context, state) {
                        return ListView.separated(
                          itemCount:
                              ProductsCubit.of(context).listOfSortModel.length,
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                ProductsCubit.of(context).onTapOnSortItem(
                                    index: index, subCateId: subCateId);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      AppSizes.getProportionateScreenHeight(5),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ProductsCubit.of(context)
                                          .listOfSortModel[index]
                                          .text,
                                      style: TextStyle(
                                        color: AppColors.fontColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ProductsCubit.of(context)
                                                .listOfSortModel[index]
                                                .isSelected ??
                                            false
                                        ? Image.asset(
                                            AppAssets.selected_icon,
                                            scale: 1,
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
