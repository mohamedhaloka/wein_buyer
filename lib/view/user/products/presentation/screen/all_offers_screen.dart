import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/products/presentation/controller/products_cubit.dart';
import 'package:wein_buyer/view/user/products/presentation/widgets/all_offers_body.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';
import '../../../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_strings.dart';

class AllOffersScreen extends StatelessWidget {
  const AllOffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(sl(), sl(), sl(), sl(), sl())
        ..getAllOffers(firstFetch: true),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.allOffers.translate(),
        ),
        body: const AllOffersBody(),
      ),
    );
  }
}
