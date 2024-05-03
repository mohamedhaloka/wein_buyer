import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/cart/presentation/controller/cart_cubit.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';

import '../../../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(sl(),sl(),sl(),sl())..getCart(),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.rubbishScreen.translate(),
        ),
        body: CartBody(),
      ),
    );
  }
}
