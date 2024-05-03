import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/orders_model.dart';
import '../../domain/repository/base_my_orders_repository.dart';
import '../datasource/my_orders_remote_datasource.dart';

class MyOrdersRepository extends BaseMyOrdersRepository {
  final BaseMyOrdersRemoteDatasource baseSectionRemoteDatasource;

  MyOrdersRepository(this.baseSectionRemoteDatasource);

  @override
  Future<Either<Failure, OrdersModel>> getMyOrders(String status) async {
    try {
      final res =
          await baseSectionRemoteDatasource.getMyOrders(status);
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
  Future<Either<Failure, bool>> rateProduct(int productId, double rate, String text) async {
    try {
      final res =
      await baseSectionRemoteDatasource.rateProduct(productId, rate, text);
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
