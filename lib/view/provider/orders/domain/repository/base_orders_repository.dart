import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/orders_model.dart';

abstract class BaseOrdersRepository {
  Future<Either<Failure, OrdersModel>> getOrders(String status);
}
