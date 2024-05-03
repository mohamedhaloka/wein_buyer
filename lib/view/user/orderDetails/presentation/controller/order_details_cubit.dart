import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/view/user/bottom_nav_user/presentation/screens/bottom_nav_user_screen.dart';
import 'package:wein_buyer/view/user/orderDetails/domain/usecases/cancel_order.dart';

import '../../../../../core/router/router.dart';
import '../../../../../widgets/snackBar.dart';

part 'order_details_state.dart';

class OrderDetailsUserCubit extends Cubit<OrderDetailsUserState> {
  OrderDetailsUserCubit(this.cancelOrderUserUseCase) : super(OrderDetailsInitial());

  static OrderDetailsUserCubit of(context) => BlocProvider.of(context);

  final CancelOrderUser cancelOrderUserUseCase;

  Future cancelOrderUser(int orderId) async {
    emit(CancelOrderUserLoading());
    final res = await cancelOrderUserUseCase.execute(orderId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(CancelOrderUserError());
      },
      (res) async {
        MagicRouter.navigateAndPopAll(BottomNavUserScreen(selectedIndex: 2));
        emit(CancelOrderUserLoaded());
      },
    );
  }
}
