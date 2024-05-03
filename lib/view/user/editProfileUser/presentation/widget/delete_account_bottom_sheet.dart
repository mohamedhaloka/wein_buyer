import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/localization/localization_methods.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../../widgets/space_width.dart';
import '../controller/edit_profile_cubit.dart';

deleteAccountBottomSheet({required BuildContext context , required EditProfileCubit editProfileCubit}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        height: AppSizes.screenHeight * 0.27,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.getProportionateScreenHeight(20),
            horizontal: AppSizes.getProportionateScreenWidth(25),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                child: Image.asset(
                  AppAssets.deleteAccount,
                  height: 45.h,
                ),
              ),
              Text(
                tr(context, AppStrings.deleteAccountDesc),
                style: TextStyle(color: Colors.black, fontSize: 16.sp),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: ()=> editProfileCubit.deleteAccount(),
                      child: SizedBox(
                        width: 90.w,
                        height: 30.h,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            tr(context, AppStrings.yes),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SpaceW(inputWidth: 14.h),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: SizedBox(
                        width: 90.w,
                        height: 30.h,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            tr(context, AppStrings.no),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
