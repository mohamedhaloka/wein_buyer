import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_popup/info_popup.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/provider/product/presentation/widget/select_sub_categories_dropdown.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/validator/validator.dart';
import '../../../../../../../widgets/input_form_field.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../controller/add_product_cubit.dart';
import '../select_main_categories_dropdown.dart';

class DetailsAddProduct extends StatelessWidget {
  const DetailsAddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: BlocBuilder<AddProductCubit, AddProductState>(
                buildWhen: (previous, current) => current is OnSelectMainCateItem,
                builder: (context, state) {
                  final categoryController =
                      AddProductCubit.of(context).categoryController;
                  return InputFormField(
                    hint: AppStrings.cate.translate(),
                    textColor: AppColors.fontColor,
                    fillColor: Colors.white,
                    controller: categoryController,
                    clickable: true,
                    validator: (v) {},
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        builder: (BuildContext cxt) {
                          return BlocProvider.value(
                            value: AddProductCubit.of(context),
                            child: const SelectMainCategoriesDropdown(),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(width: AppSizes.getProportionateScreenWidth(10)),
            InfoPopupWidget(
              contentTitle: AppStrings.cateInfo.translate(),
              contentTheme: const InfoPopupContentTheme(
                infoTextStyle: TextStyle(color: AppColors.primaryColor),
              ),
              child: const Icon(Icons.info),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: BlocBuilder<AddProductCubit, AddProductState>(
                buildWhen: (previous, current) => current is OnSelectSubCateItem,
                builder: (context, state) {
                  final categoryController =
                      AddProductCubit.of(context).subCategoryController;
                  return InputFormField(
                    hint: AppStrings.subCate.translate(),
                    textColor: AppColors.fontColor,
                    fillColor: Colors.white,
                    controller: categoryController,
                    clickable: true,
                    validator: (v) {},
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        builder: (BuildContext cxt) {
                          return BlocProvider.value(
                            value: AddProductCubit.of(context),
                            child: const SelectSubCategoriesDropdown(),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(width: AppSizes.getProportionateScreenWidth(10)),
            InfoPopupWidget(
              contentTitle: AppStrings.subCateInfo.translate(),
              contentTheme: const InfoPopupContentTheme(
                infoTextStyle: TextStyle(color: AppColors.primaryColor),
              ),
              child: const Icon(Icons.info),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: InputFormField(
                hint: AppStrings.productName.translate(),
                textColor: AppColors.fontColor,
                fillColor: Colors.white,
                controller: AddProductCubit.of(context).nameController,
                validator: (v) => Validator.generalField(v),
              ),
            ),
            SizedBox(width: AppSizes.getProportionateScreenWidth(10)),
            InfoPopupWidget(
              contentTitle: AppStrings.nameProductInfo.translate(),
              contentTheme: const InfoPopupContentTheme(
                infoTextStyle: TextStyle(color: AppColors.primaryColor),
              ),
              child: const Icon(Icons.info),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: InputFormField(
                hint: AppStrings.productDesc.translate(),
                textColor: AppColors.fontColor,
                fillColor: Colors.white,
                controller: AddProductCubit.of(context).descController,
                validator: (v) => Validator.productDetails(v),
              ),
            ),
            SizedBox(width: AppSizes.getProportionateScreenWidth(10)),
            InfoPopupWidget(
              contentTitle: AppStrings.descProductInfo.translate(),
              contentTheme: const InfoPopupContentTheme(
                infoTextStyle: TextStyle(color: AppColors.primaryColor),
              ),
              child: const Icon(Icons.info),
            ),
          ],
        ),
      ],
    );
  }
}
