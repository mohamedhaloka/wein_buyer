import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/user/myOrders/domain/repository/base_my_orders_repository.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/orders_model.dart';

class GetMyOrders {
  final BaseMyOrdersRepository baseMyOrdersRepository;

  GetMyOrders(this.baseMyOrdersRepository);

  Future<Either<Failure, OrdersModel>> execute(String status) async {
    return await baseMyOrdersRepository.getMyOrders(status);
  }
}
