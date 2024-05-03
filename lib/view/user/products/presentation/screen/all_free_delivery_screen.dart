import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/products/presentation/controller/products_cubit.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';
import '../../../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widgets/all_free_delivery_body.dart';


class AllFreeDeliveryScreen extends StatelessWidget {
  const AllFreeDeliveryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(sl(), sl(), sl(), sl(), sl())..getAllFreeDelivery(firstFetch: true),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.products.translate(),
        ),
        body: const AllFreeDeliveryBody(),
      ),
    );
  }
}
