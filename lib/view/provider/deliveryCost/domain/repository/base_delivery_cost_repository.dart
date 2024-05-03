import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../core/models/delivery_cost_model.dart';
import '../../data/models/delivery_cost_services_model.dart';

abstract class BaseDeliveryCostRepository {
  Future<Either<Failure, DeliveryCostModel>> getDeliveryCost();
  Future<Either<Failure, bool>> updateDeliveryCost(DeliveryCostServicesModel deliveryCostServicesModel);
}
