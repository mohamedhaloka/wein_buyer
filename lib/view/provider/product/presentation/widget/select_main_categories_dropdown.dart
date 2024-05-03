import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/categories_model.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/provider/product/presentation/controller/add_product_cubit.dart';

import '../../../../../../widgets/main_category_dropdown_item.dart';
import '../../../../../core/utils/app_strings.dart';

class SelectMainCategoriesDropdown extends StatelessWidget {
  const SelectMainCategoriesDropdown({Key? key}) : super(key: key);

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
              AppStrings.mainCateHide.translate(),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<AddProductCubit, AddProductState>(
              buildWhen: (previous, current) => current is OnSelectMainCateItem,
              builder: (context, state) {
                List<CategoryData> listOfCate =
                    AddProductCubit.of(context).listOfCate;
                return Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizes.getProportionateScreenHeight(10),
                    horizontal: AppSizes.getProportionateScreenHeight(20),
                  ),
                  child: ListView.builder(
                    itemCount: listOfCate.length,
                    itemBuilder: (context, index) {
                      return MainCategoryDropdownItem(
                        item: listOfCate[index],
                        onTap: () => AddProductCubit.of(context)
                            .onSelectMainCateItem(index),
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
