import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/widgets/bottom_sheet_return_policy_widget.dart';

import '../../../../../../../core/models/product.dart';
import '../../../../../../../core/models/product_details.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';

class ReturnPolicyBTN extends StatelessWidget {
  const ReturnPolicyBTN({Key? key, required this.product}) : super(key: key);

  final ProductDetails product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
          builder: (BuildContext context) {
            return BottomSheetReturnPolicyWidget(
              text: product.returnPolicy ?? '',
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.getProportionateScreenWidth(25),
          vertical: AppSizes.getProportionateScreenHeight(10),
        ),
        color: const Color.fromRGBO(251, 251, 251, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.returnPrivacy.translate(),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.fontColor,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.fontColor,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
