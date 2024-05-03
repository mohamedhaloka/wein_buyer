import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/widgets/space_width.dart';

customShowDialog({
  required BuildContext context,
  required String title,
  required Function() yes,
}) {
  return showDialog(
    context: context,
    builder: (_) => viewBuilder(
      context: context,
      title: title,
      yes: yes,
    ),
  );
}

Widget viewBuilder(
    {required BuildContext context,
    required Function() yes,
    required String title}) {
  return Center(
    child: Container(
      margin: EdgeInsets.all(16.h),
      padding: EdgeInsets.all(6.h),
      height: 170.h,
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
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
            title,
            style: TextStyle(color: Colors.black, fontSize: 16.sp),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: yes,
                  child: SizedBox(
                    width: 90.w,
                    height: 30.h,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'yes',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SpaceW(inputWidth: 14.h),
                InkWell(
                  onTap: ()=> Navigator.of(context).pop(),
                  child: SizedBox(
                    width: 90.w,
                    height: 30.h,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'no',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 90.w,
                //   height: 30.h,
                //   child: CustomButton(
                //     text: 'no',
                //     radius: 7.r,
                //     onPress: () => MagicRouter.pop(),
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
