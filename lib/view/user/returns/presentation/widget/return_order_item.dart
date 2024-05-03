import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/user/returns/presentation/widget/returns_bottom_sheet.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import 'package:wein_buyer/widgets/space_width.dart';

import '../../../../../core/utils/app_strings.dart';

class ReturnOrderItem extends StatelessWidget {
  const ReturnOrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Color.fromRGBO(239, 238, 238, 1),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            AppSizes.getProportionateScreenWidth(5),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: AppSizes.getProportionateScreenWidth(40),
                        child: Image.asset(AppAssets.image_profile),
                      ),
                      SpaceW(inputWidth: 5),
                      Text(
                        AppStrings.shopping.translate(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: AppColors.fontColor,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return ReturnsBottomSheet();
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          AppStrings.resionOfReturn.translate(),
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.red,
                          size: 22.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SpaceH(inputHeigth: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.code,
                        color: Colors.grey,
                      ),
                      SpaceW(inputWidth: 5),
                      Text(
                        '#1255633',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.date_range,
                        color: Colors.grey,
                      ),
                      SpaceW(inputWidth: 5),
                      Text(
                        '22 / 5/ 2022',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        AppAssets.market_logo,
                      ),
                    ),
                  ),
                  SpaceW(inputWidth: 10),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'فستان بناتى اخضر من الستان الحريرى و اسكارف ابيض ديجيتال',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.GrayColor112,
                          ),
                        ),
                        SpaceH(inputHeigth: 10),
                        Text(
                          '5+منتجات',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.fontColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
