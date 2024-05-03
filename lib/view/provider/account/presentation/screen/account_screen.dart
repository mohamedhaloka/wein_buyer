import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/provider/account/presentation/controller/account_cubit.dart';
import 'package:wein_buyer/view/provider/market/presentation/controller/market_cubit.dart';

import '../../../../../../core/services/services_locator.dart';
import '../widget/account_appbar.dart';
import '../widget/account_body.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              MarketCubit(sl(), sl(), sl(), sl(), sl(), sl())..getProfileData(),
        ),
        BlocProvider(
          create: (context) => AccountCubit(sl(), sl()),
        ),
      ],
      child: const Scaffold(
        appBar: AccountAppBar(),
        body: AccountBody(),
      ),
    );
  }
}
