import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/view/user/bottom_nav_user/presentation/screens/bottom_nav_user_screen.dart';
import 'package:wein_buyer/view/user/cart/domain/usecases/remove_item.dart';

import '../../../../../../../core/models/cart_model.dart';
import '../../../../../../../widgets/snackBar.dart';
import '../../domain/usecases/checkout.dart';
import '../../domain/usecases/get_cart.dart';
import '../../domain/usecases/update_item_quantity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.getCartUseCase, this.removeItemUseCase,
      this.updateItemQuantityUseCase, this.checkoutUseCase)
      : super(CartInitial());

  static CartCubit of(context) => BlocProvider.of(context);

  final GetCart getCartUseCase;
  final RemoveItem removeItemUseCase;
  final UpdateItemQuantity updateItemQuantityUseCase;
  final Checkout checkoutUseCase;

  List<Items> listOfItems = [];
  Cart? cartModel;

  int quantity = 1;

  Future chechout(int addressId) async {
    emit(CheckoutLoading());
    final res = await checkoutUseCase.execute(addressId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(CheckoutError());
      },
      (res) async {
        MagicRouter.navigateAndPopAll(BottomNavUserScreen(
          selectedIndex: 0,
        ));
        emit(CheckoutLoaded());
      },
    );
  }

  Future removeItem(String itemId) async {
    emit(RemoveItemLoading());
    final res = await removeItemUseCase.execute(itemId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(RemoveItemError());
      },
      (res) async {
        listOfItems.removeWhere((element) => element.itemId == itemId);
        cartModel = res;
        emit(RemoveItemLoaded());
      },
    );
  }

  Future updateItemQuantity(String itemId, int quantity) async {
    emit(UpdateItemQuantityLoading());
    final res = await updateItemQuantityUseCase.execute(itemId, quantity);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(UpdateItemQuantityError());
      },
      (res) async {
        Items item =
            listOfItems.firstWhere((element) => element.itemId == itemId);
        int index =
            listOfItems.indexWhere((element) => element.itemId == itemId);
        listOfItems.removeWhere((element) => element.itemId == itemId);
        listOfItems.insert(
            index,
            Items(
              itemId: item.itemId,
              product: item.product,
              quantity: quantity == 1
                  ? item.quantity!.toInt() + 1
                  : item.quantity!.toInt() - 1,
              price: item.price,
              properties: item.properties,
            ));
        cartModel = res;
        emit(UpdateItemQuantityLoaded());
      },
    );
  }

  Future getCart() async {
    emit(GetCartLoading());
    final res = await getCartUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetCartError());
      },
      (res) async {
        listOfItems.addAll(res.items ?? []);
        cartModel = res;
        emit(GetCartLoaded());
      },
    );
  }
}
