import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../core/models/delivery_cost_model.dart';
import '../repository/base_delivery_cost_repository.dart';

class GetDeliveryCost {
  final BaseDeliveryCostRepository baseDeliveryCostRepository;

  GetDeliveryCost(this.baseDeliveryCostRepository);

  Future<Either<Failure, DeliveryCostModel>> execute() async {
    return await baseDeliveryCostRepository.getDeliveryCost();
  }
}
