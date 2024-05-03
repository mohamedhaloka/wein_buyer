import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/products_provider_model.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../controller/add_product_cubit.dart';
import '../widget/edit/edit_product_body.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({Key? key, required this.productData})
      : super(key: key);
  final ProductData productData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(sl(), sl(), sl(), sl(), sl())
        ..initData(context, productData),
      child: Scaffold(
        appBar: CustomAppBar(
          text: 'تعديل المنتج',
        ),
        body: const EditProductBody(),
      ),
    );
  }
}
