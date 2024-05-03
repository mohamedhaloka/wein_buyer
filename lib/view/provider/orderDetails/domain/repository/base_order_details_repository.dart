import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/orders_model.dart';

abstract class BaseOrderDetailsRepository {
  Future<Either<Failure, bool>> acceptOrder(int orderId);

  Future<Either<Failure, bool>> rejectOrder(int orderId, String rejectReason);

  Future<Either<Failure, bool>> cancelOrder(int orderId, String cancelReason);

  Future<Either<Failure, bool>> deliverOrder(int orderId, String pricePaid);
}
