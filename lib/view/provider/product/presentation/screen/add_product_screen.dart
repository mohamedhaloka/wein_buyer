import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/provider/product/presentation/controller/add_product_cubit.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';

import '../../../../../../core/services/services_locator.dart';
import '../widget/add/add_product_body.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(sl() , sl() , sl() , sl(), sl())..getAllCategories(),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.addProduct.translate(),
        ),
        body: const AddProductBody(),
      ),
    );
  }
}
