import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/user/myOrders/domain/repository/base_my_orders_repository.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/orders_model.dart';

class RateProduct {
  final BaseMyOrdersRepository baseMyOrdersRepository;

  RateProduct(this.baseMyOrdersRepository);

  Future<Either<Failure, bool>> execute(int productId, double rate, String text) async {
    return await baseMyOrdersRepository.rateProduct(productId, rate, text);
  }
}
