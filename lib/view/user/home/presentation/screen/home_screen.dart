import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/user/addresses/presentation/controller/addresses_cubit.dart';
import 'package:wein_buyer/view/user/home/presentation/controller/home_cubit.dart';
import 'package:wein_buyer/view/user/products/presentation/controller/products_cubit.dart';

import '../../../../../../../core/services/services_locator.dart';
import '../widget/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AddressesCubit(sl(), sl(), sl(), sl(), sl())..getAddresses(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(sl())..getHomeData(),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(sl(),sl(),sl(),sl(),sl())..getProductBySubCategory(0),
        ),
      ],
      child: Scaffold(
        body: HomeBody(),
      ),
    );
  }
}
