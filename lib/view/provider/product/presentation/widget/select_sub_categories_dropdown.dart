import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/sub_categories_provider_model.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/provider/product/presentation/controller/add_product_cubit.dart';
import 'package:wein_buyer/widgets/sub_category_dropdown_item.dart';

class SelectSubCategoriesDropdown extends StatelessWidget {
  const SelectSubCategoriesDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            color: AppColors.primaryColor,
            padding: EdgeInsets.only(
              right: AppSizes.getProportionateScreenWidth(10),
            ),
            alignment: Alignment.centerRight,
            child: Text(
              AppStrings.subCateHide.translate(),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<AddProductCubit, AddProductState>(
              buildWhen: (previous, current) => current is OnSelectSubCateItem,
              builder: (context, state) {
                List<SubCategoryData> listOfSubCate =
                    AddProductCubit.of(context).listOfSubCate;
                return Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizes.getProportionateScreenHeight(10),
                    horizontal: AppSizes.getProportionateScreenHeight(20),
                  ),
                  child: ListView.builder(
                    itemCount: listOfSubCate.length,
                    itemBuilder: (context, index) {
                      return SubCategoryDropdownItem(
                        item: listOfSubCate[index],
                        onTap: () => AddProductCubit.of(context)
                            .onSelectSubCateItem(index),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
