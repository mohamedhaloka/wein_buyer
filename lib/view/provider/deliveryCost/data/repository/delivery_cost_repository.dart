import 'package:dartz/dartz.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../core/models/delivery_cost_model.dart';
import '../../domain/repository/base_delivery_cost_repository.dart';
import '../datasource/delivery_cost_datasource.dart';
import '../models/delivery_cost_services_model.dart';

class DeliveryCostRepository extends BaseDeliveryCostRepository {
  final BaseDeliveryCostRemoteDatasource baseDeliveryCostRemoteDatasource;

  DeliveryCostRepository(this.baseDeliveryCostRemoteDatasource);

  @override
  Future<Either<Failure, DeliveryCostModel>> getDeliveryCost() async {
    try {
      final res = await baseDeliveryCostRemoteDatasource.getDeliveryCost();
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
  Future<Either<Failure, bool>> updateDeliveryCost(
      DeliveryCostServicesModel deliveryCostServicesModel) async {
    try {
      final res = await baseDeliveryCostRemoteDatasource.updateDeliveryCost(
          deliveryCostServicesModel);
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
