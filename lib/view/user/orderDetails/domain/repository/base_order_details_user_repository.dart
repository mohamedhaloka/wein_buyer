import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/orders_model.dart';
import '../../../../../../../core/models/products_model.dart';

abstract class BaseOrderDetailsUserRepository {
  Future<Either<Failure, bool>> cancelOrder(int orderId);
}
