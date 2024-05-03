import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/orders_model.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/view/user/myOrders/domain/usecases/get_my_orders.dart';
import 'package:wein_buyer/view/user/myOrders/domain/usecases/rate_product.dart';

import '../../../../../../../widgets/snackBar.dart';
import '../../../../../core/utils/app_strings.dart';

part 'my_orders_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit(this.getMyOrdersUseCase, this.rateProductUseCase)
      : super(MyOrdersInitial());

  static MyOrdersCubit of(context) => BlocProvider.of(context);

  final GetMyOrders getMyOrdersUseCase;
  final RateProduct rateProductUseCase;

  List<Order> listOfOrders = [];

  final noteController = TextEditingController();
  double? rate;

  Future getMyOrders(String status) async {
    listOfOrders.clear();
    emit(GetMyOrdersLoading());
    final res = await getMyOrdersUseCase.execute(status);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetMyOrdersError());
      },
      (res) async {
        listOfOrders.addAll(res.body ?? []);
        emit(GetMyOrdersLoaded());
      },
    );
  }

  Future rateProduct(int productId) async {
    if (noteController.text.isNotEmpty || rate != 0) {
      emit(RateProductLoading());
      final res = await rateProductUseCase.execute(
          productId, rate ?? 0, noteController.text);
      res.fold(
        (err) {
          showSnackBar(err.message);
          emit(RateProductError());
        },
        (res) async {
          MagicRouter.pop();
          emit(RateProductLoaded());
          noteController.clear();
          rate = 0;
        },
      );
    } else {
      showSnackBar(AppStrings.pleaseCompleteInfoMsg.translate());
    }
  }
}
