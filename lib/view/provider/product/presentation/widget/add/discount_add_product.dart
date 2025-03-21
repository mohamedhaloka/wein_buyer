import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_popup/info_popup.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/validator/validator.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../widgets/custom_button.dart';
import '../../../../../../../widgets/input_form_field.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../controller/add_product_cubit.dart';

class DiscountAddProduct extends StatelessWidget {
  const DiscountAddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: InputFormField(
                hint: AppStrings.productPrice.translate(),
                textColor: AppColors.fontColor,
                fillColor: Colors.white,
                controller: AddProductCubit.of(context).priceController,
                isNumber: true,
                validator: (v) => Validator.productPrice(v),
              ),
            ),
            SizedBox(width: AppSizes.getProportionateScreenWidth(10)),
            InfoPopupWidget(
              contentTitle: AppStrings.productPriceInfo.translate(),
              contentTheme: const InfoPopupContentTheme(
                infoTextStyle: TextStyle(color: AppColors.primaryColor),
              ),
              child: const Icon(Icons.info),
            ),
          ],
        ),
        BlocBuilder<AddProductCubit, AddProductState>(
          buildWhen: (previous, current) => current is CalcuDescount,
          builder: (context, state) => Row(
            children: [
              Expanded(
                flex: 1,
                child: InputFormField(
                  hint: AppStrings.discountValue.translate(),
                  textColor: AppColors.fontColor,
                  fillColor: Colors.white,
                  isNumber: true,
                  controller: AddProductCubit.of(context).discountController,
                  validator: (v) {},
                  onChanged: (v) => AddProductCubit.of(context).calculateDiscount(v),
                ),
              ),
              SpaceW(inputWidth: 10),
              Expanded(
                flex: 1,
                child: InputFormField(
                  hint: AppStrings.productAfterPrice.translate(),
                  textColor: AppColors.fontColor,
                  fillColor: Colors.white,
                  isNumber: true,
                  controller:
                      AddProductCubit.of(context).priceAfterDiscountController,
                  onChanged: (v) => AddProductCubit.of(context).calculateDiscountPercentage(),
                  validator: (v) {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
