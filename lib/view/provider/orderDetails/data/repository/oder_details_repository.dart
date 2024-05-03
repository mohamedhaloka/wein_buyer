import 'package:dartz/dartz.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/orders_model.dart';
import '../../domain/repository/base_order_details_repository.dart';
import '../datasource/order_details_remote_datasource.dart';

class OrderDetailsRepository extends BaseOrderDetailsRepository {
  final BaseOrderDetailsRemoteDatasource baseOrderDetailsRemoteDatasource;

  OrderDetailsRepository(this.baseOrderDetailsRemoteDatasource);

  @override
  Future<Either<Failure, bool>> deliverOrder(int orderId, String pricePaid) async {
    try {
      final res = await baseOrderDetailsRemoteDatasource.deliverOrder(orderId , pricePaid);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, bool>> cancelOrder(int orderId, String cancelReason) async {
    try {
      final res = await baseOrderDetailsRemoteDatasource.cancelOrder(orderId , cancelReason);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, bool>> rejectOrder(int orderId, String rejectReason) async {
    try {
      final res = await baseOrderDetailsRemoteDatasource.rejectOrder(orderId , rejectReason);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, bool>> acceptOrder(int orderId) async {
    try {
      final res = await baseOrderDetailsRemoteDatasource.acceptOrder(orderId);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }
}
