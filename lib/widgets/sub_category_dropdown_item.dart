import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/models/sub_categories_model.dart';
import '../core/models/sub_categories_provider_model.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_sizes.dart';

class SubCategoryDropdownItem extends StatefulWidget {
  const SubCategoryDropdownItem({Key? key, required this.item, required this.onTap}) : super(key: key);

  final SubCategoryData item;
  final Function() onTap;

  @override
  State<SubCategoryDropdownItem> createState() => _SubCategoryDropdownItemState();
}

class _SubCategoryDropdownItemState extends State<SubCategoryDropdownItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.getProportionateScreenHeight(8),
          vertical: AppSizes.getProportionateScreenHeight(5),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.35,
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenHeight(5),
            vertical: AppSizes.getProportionateScreenHeight(16),
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            border: Border.all(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.item.name??'',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.fontColor,
                ),
              ),
              widget.item.isSelected! ? const Icon(
                Icons.check_outlined,
                color: AppColors.primaryColor,
              ) : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
