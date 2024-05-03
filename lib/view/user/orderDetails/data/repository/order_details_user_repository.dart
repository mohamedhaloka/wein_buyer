import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/user/orderDetails/domain/repository/base_order_details_user_repository.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/error/failure.dart';
import '../datasource/order_details_user_remote_datasource.dart';

class OrderDetailsUserRepository extends BaseOrderDetailsUserRepository {
  final BaseOrderDetailsUserRemoteDatasource baseOrderDetailsUserRemoteDatasource;

  OrderDetailsUserRepository(this.baseOrderDetailsUserRemoteDatasource);

  @override
  Future<Either<Failure, bool>> cancelOrder(int orderId) async {
    try {
      final res =
      await baseOrderDetailsUserRemoteDatasource.cancelOrder(orderId);
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
