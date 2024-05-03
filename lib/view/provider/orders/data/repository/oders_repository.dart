import 'package:dartz/dartz.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/orders_model.dart';
import '../../domain/repository/base_orders_repository.dart';
import '../datasource/orders_remote_datasource.dart';

class OrdersRepository extends BaseOrdersRepository {
  final BaseOrdersRemoteDatasource baseOrdersRemoteDatasource;

  OrdersRepository(this.baseOrdersRemoteDatasource);

  @override
  Future<Either<Failure, OrdersModel>> getOrders(String status) async {
    try {
      final res = await baseOrdersRemoteDatasource.getOrders(status);
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
