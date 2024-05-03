import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/view/provider/bottom_nav_provider/presentation/screens/bottom_nav_provider_screen.dart';
import 'package:wein_buyer/view/provider/orderDetails/domain/usecases/accept_order.dart';
import 'package:wein_buyer/view/provider/orderDetails/domain/usecases/deliver_order.dart';
import 'package:wein_buyer/view/provider/orderDetails/domain/usecases/reject_order.dart';
import '../../../../../../widgets/snackBar.dart';
import '../../domain/usecases/cancel_order.dart';
import '../widget/done_received_amount_bottom_sheet.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this.acceptOrderUseCase, this.rejectOrderUseCase,
      this.deliverOrderUseCase, this.cancelOrderUseCase)
      : super(OrderDetailsInitial());

  static OrderDetailsCubit of(context) => BlocProvider.of(context);

  final AcceptOrder acceptOrderUseCase;
  final RejectOrder rejectOrderUseCase;
  final CancelOrder cancelOrderUseCase;
  final DeliverOrder deliverOrderUseCase;

  final rejectReasonController = TextEditingController();
  final cancelReasonController = TextEditingController();
  final pricePaidController = TextEditingController();

  Future deliverOrder(BuildContext context , int orderId, String pricePaid) async {
    emit(DeliverOrderLoading());
    final res = await deliverOrderUseCase.execute(orderId, pricePaid);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(DeliverOrderError());
      },
      (res) async {
        MagicRouter.pop();
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          builder: (BuildContext context) {
            return const DoneReceivedAmountBottomSheet();
          },
        );
        emit(DeliverOrderLoaded());
      },
    );
  }

  Future cancelOrder(int orderId, String cancelReason) async {
    emit(CancelOrderLoading());
    final res = await cancelOrderUseCase.execute(orderId, cancelReason);
    res.fold(
      (err) {
        showSnackBar(err.message);
        cancelReasonController.clear();
        emit(CancelOrderError());
      },
      (res) async {
        MagicRouter.navigateAndPopAll(BottomNavProviderScreen(selectedIndex: 0));
        cancelReasonController.clear();
        emit(CancelOrderLoaded());
      },
    );
  }

  Future rejectOrder(int orderId, String rejectReason) async {
    emit(RejectOrderLoading());
    final res = await rejectOrderUseCase.execute(orderId, rejectReason);
    res.fold(
      (err) {
        showSnackBar(err.message);
        rejectReasonController.clear();
        emit(RejectOrderError());
      },
      (res) async {
        MagicRouter.navigateAndPopAll(BottomNavProviderScreen(selectedIndex: 0));
        rejectReasonController.clear();
        emit(RejectOrderLoaded());
      },
    );
  }

  Future acceptOrder(int orderId) async {
    emit(AcceptOrderLoading());
    final res = await acceptOrderUseCase.execute(orderId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(AcceptOrderError());
      },
      (res) async {
        MagicRouter.navigateAndPopAll(BottomNavProviderScreen(selectedIndex: 0));
        emit(AcceptOrderLoaded());
      },
    );
  }
}
