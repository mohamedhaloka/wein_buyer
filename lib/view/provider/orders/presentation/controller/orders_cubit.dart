import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/models/orders_model.dart';
import 'package:wein_buyer/view/provider/orders/domain/usecases/get_orders.dart';

import '../../../../../../widgets/snackBar.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.getOrdersUseCase) : super(OrdersInitial());

  static OrdersCubit of(context) => BlocProvider.of(context);

  final GetOrders getOrdersUseCase;

  List<Order> listOfOrders = [];

  Future getOrders(String status) async {
    listOfOrders.clear();
    emit(GetOrdersLoading());
    final res = await getOrdersUseCase.execute(status);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetOrdersError());
      },
      (res) async {
        listOfOrders.addAll(res.body ?? []);
        emit(GetOrdersLoaded());
      },
    );
  }
}
