import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/provider/product/presentation/widget/edit/details_edit_product.dart';
import 'package:wein_buyer/view/provider/product/presentation/widget/edit/images_edit_product.dart';

import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../widgets/custom_button.dart';
import '../../../../../../widgets/loading_indicator.dart';
import '../../../../../../widgets/space_height.dart';
import '../../controller/add_product_cubit.dart';
import '../add/images_add_product.dart';
import 'discount_edit_product.dart';
import 'properties_edit_product.dart';

class EditProductBody extends StatelessWidget {
  const EditProductBody({Key? key}) : super(key: key);

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
              const DetailsEditProduct(),
              SpaceH(inputHeigth: 5),
              const ImagesEditProduct(),
              SpaceH(inputHeigth: 5),
              const DiscountEditProduct(),
              SpaceH(inputHeigth: 15),
              const PropertiesEditProduct(),
              SpaceH(inputHeigth: 10),
              BlocBuilder<AddProductCubit, AddProductState>(
                builder: (context, state) {
                  return state is EditProductLoading
                      ? const LoadingIndicator()
                      : CustomButton(
                    text: 'تعديل',
                    paddingVertical:
                    AppSizes.getProportionateScreenHeight(15),
                    onPress: (){
                      AddProductCubit.of(context).editProduct(context);
                    },
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
