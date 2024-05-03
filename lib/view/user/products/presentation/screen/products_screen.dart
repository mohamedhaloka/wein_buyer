import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/products/presentation/controller/products_cubit.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';
import '../../../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widgets/products_body.dart';
import '../widgets/products_floating_action_btn.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key, required this.subCateId}) : super(key: key);

  final int subCateId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(sl(), sl(), sl(), sl(), sl())
        ..getProductBySubCategory(subCateId),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.products.translate(),
        ),
        body: const ProductsBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ProductsFloatingActionBTN(
          subCateId: subCateId,
        ),
      ),
    );
  }
}
