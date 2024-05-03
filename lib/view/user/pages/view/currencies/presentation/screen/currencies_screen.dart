import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/user/pages/view/currencies/presentation/widget/currencies_body.dart';
import '../../../../../../../core/services/services_locator.dart';
import '../../../../../../../widgets/custom_appbar.dart';
import '../../../controller/pages_cubit.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PagesCubit(sl(), sl(), sl(), sl())..getCurrencies(),
      child: Scaffold(
        appBar: CustomAppBar(text: 'العملات'),
        body: const CurrenciesBody(),
      ),
    );
  }
}
