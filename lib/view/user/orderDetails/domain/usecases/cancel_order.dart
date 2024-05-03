import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/user/myOrders/domain/repository/base_my_orders_repository.dart';
import 'package:wein_buyer/view/user/orderDetails/domain/repository/base_order_details_user_repository.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/orders_model.dart';

class CancelOrderUser {
  final BaseOrderDetailsUserRepository baseOrderDetailsUserRepository;

  CancelOrderUser(this.baseOrderDetailsUserRepository);

  Future<Either<Failure, bool>> execute(int orderId) async {
    return await baseOrderDetailsUserRepository.cancelOrder(orderId);
  }
}
