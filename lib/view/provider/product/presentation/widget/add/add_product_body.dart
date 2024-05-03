import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/provider/product/presentation/controller/add_product_cubit.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import 'package:wein_buyer/widgets/input_form_field.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import 'package:wein_buyer/widgets/space_width.dart';
import 'details_add_product.dart';
import 'discount_add_product.dart';
import 'images_add_product.dart';
import 'properties_add_product.dart';

class AddProductBody extends StatelessWidget {
  const AddProductBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(10),
        horizontal: AppSizes.getProportionateScreenWidth(15),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: AddProductCubit.of(context).formKey,
          child: Column(
            children: [
              const DetailsAddProduct(),
              SpaceH(inputHeigth: 5),
              const ImagesAddProduct(),
              SpaceH(inputHeigth: 5),
              const DiscountAddProduct(),
              SpaceH(inputHeigth: 15),
              const PropertiesAddProduct(),
              SpaceH(inputHeigth: 10),
              BlocBuilder<AddProductCubit, AddProductState>(
                builder: (context, state) {
                  return state is AddProductLoading
                      ? const LoadingIndicator()
                      : CustomButton(
                          text: AppStrings.add.translate(),
                          paddingVertical:
                              AppSizes.getProportionateScreenHeight(15),
                          onPress: () =>
                              AddProductCubit.of(context).addProduct(context),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
