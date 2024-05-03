import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../controller/size_guide_cubit.dart';
import 'add_size_guide_bottom_sheet.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(15),
        horizontal: AppSizes.getProportionateScreenWidth(20),
      ),
      child: Container(
        width: AppSizes.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppAssets.noDataCuate),
            Text(
              AppStrings.noNewAdd.translate(),
              style: TextStyle(
                color: AppColors.GrayColor112,
                fontSize: 16.sp,
              ),
            ),
            TextButton(
              child: Text(
                AppStrings.newAdd.translate(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  fontSize: 16.sp,
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  builder: (BuildContext cont) {
                    return BlocProvider.value(
                      value: SizeGuideCubit.of(context),
                      child: const AddSizeGuideBottomSheet(),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
