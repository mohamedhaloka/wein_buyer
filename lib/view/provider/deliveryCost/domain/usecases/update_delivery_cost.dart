import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failure.dart';
import '../../data/models/delivery_cost_services_model.dart';
import '../repository/base_delivery_cost_repository.dart';

class UpdateDeliveryCost {
  final BaseDeliveryCostRepository baseDeliveryCostRepository;

  UpdateDeliveryCost(this.baseDeliveryCostRepository);

  Future<Either<Failure, bool>> execute(DeliveryCostServicesModel deliveryCostServicesModel) async {
    return await baseDeliveryCostRepository.updateDeliveryCost(deliveryCostServicesModel);
  }
}
