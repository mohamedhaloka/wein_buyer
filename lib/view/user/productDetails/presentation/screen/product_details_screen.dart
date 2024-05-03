import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/user/addresses/presentation/controller/addresses_cubit.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/controller/product_details_cubit.dart';
import '../../../../../../../core/services/services_locator.dart';
import '../widgets/product_details_appbar.dart';
import '../widgets/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);

  final int productId;

  @override
  Widget build(BuildContext context) {
    print("??????????????? $productId");
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          ProductDetailsCubit(sl(), sl(), sl(), sl(), sl(), sl())
            ..getRelatedProducts(productId)
            ..getProductDetails(productId),
        ),
        BlocProvider(
          create: (context) => AddressesCubit(sl(), sl(), sl(), sl(), sl())..getAddresses(),
        ),
      ],
      child: Scaffold(
        appBar: ProductDetailsAppBar(id: productId),
        body: const ProductDetailsBody(),
      ),
    );
  }
}
