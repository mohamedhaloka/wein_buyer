import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/products/presentation/controller/products_cubit.dart';
import '../../../../../core/utils/app_strings.dart';
import 'bottom_sheet_filter_widget.dart';
import 'bottom_sheet_sort_by_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';

class ProductsFloatingActionBTN extends StatelessWidget {
  const ProductsFloatingActionBTN({Key? key, required this.subCateId})
      : super(key: key);

  final int subCateId;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.getProportionateScreenHeight(45),
      width: AppSizes.getProportionateScreenWidth(200),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  builder: (BuildContext conxt) {
                    return BlocProvider.value(
                      value: ProductsCubit.of(context),
                      child: BottomSheetSortByWidget(
                        subCateId: subCateId,
                      ),
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.filter_list_outlined,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                  Text(
                    AppStrings.bottomSheetSortByWidget.translate(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: AppSizes.getProportionateScreenWidth(1),
            height: AppSizes.getProportionateScreenHeight(45),
            color: Colors.white,
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  builder: (BuildContext conxt) {
                    return BlocProvider.value(
                      value: ProductsCubit.of(context),
                      child: BottomSheetFilterWidget(
                        subCateId: subCateId,
                      ),
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.filter_alt,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                  Text(
                  AppStrings.filter.translate(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
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
