import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_popup/info_popup.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/validator/validator.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../widgets/input_form_field.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../controller/add_product_cubit.dart';

class DiscountEditProduct extends StatelessWidget {
  const DiscountEditProduct({Key? key}) : super(key: key);

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
        Row(
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
                onChanged: (v) {
                  AddProductCubit.of(context).calcuDiscount(v);
                },
              ),
            ),
            SpaceW(inputWidth: 10),
            Expanded(
              flex: 1,
              child: BlocBuilder<AddProductCubit, AddProductState>(
                buildWhen: (previous, current) => current is CalcuDescount,
                builder: (context, state) {
                  return InputFormField(
                    hint: AppStrings.productAfterPrice.translate(),
                    clickable: true,
                    textColor: const Color.fromRGBO(161, 147, 147, 1),
                    fillColor: const Color.fromRGBO(251, 251, 251, 1),
                    controller: AddProductCubit.of(context)
                        .priceAfterDiscountController,
                    validator: (v) {},
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
