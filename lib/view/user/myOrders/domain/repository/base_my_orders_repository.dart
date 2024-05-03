import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/orders_model.dart';
import '../../../../../../../core/models/products_model.dart';

abstract class BaseMyOrdersRepository {
  Future<Either<Failure, OrdersModel>> getMyOrders(String status);
  Future<Either<Failure, bool>> rateProduct(int productId, double rate, String text);
}
