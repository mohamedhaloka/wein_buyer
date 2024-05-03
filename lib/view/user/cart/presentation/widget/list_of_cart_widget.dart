import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/cart/presentation/controller/cart_cubit.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';

import '../../../../../core/utils/app_strings.dart';
import 'cart_item.dart';

class ListOfCartWidget extends StatelessWidget {
  const ListOfCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CartCubit, CartState>(
        buildWhen: (previous, current) =>
            current is UpdateItemQuantityLoaded ||
            current is GetCartLoaded ||
            current is RemoveItemLoaded,
        builder: (context, state) {
          if (state is GetCartLoaded || state is UpdateItemQuantityLoaded || state is RemoveItemLoaded) {
            if (CartCubit.of(context).listOfItems.isNotEmpty) {
              return ListView.builder(
                itemCount: CartCubit.of(context).listOfItems.length,
                itemBuilder: (context, index) {
                  return CartItem(
                    items: CartCubit.of(context).listOfItems[index],
                  );
                },
              );
            } else {
              return  Center(
                child: Text(AppStrings.emptyRubbish.translate()),
              );
            }
          } else {
            return const LoadingIndicator();
          }
        },
      ),
    );
  }
}
