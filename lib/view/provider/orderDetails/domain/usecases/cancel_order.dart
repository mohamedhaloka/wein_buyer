import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/provider/orderDetails/domain/repository/base_order_details_repository.dart';
import '../../../../../../core/error/failure.dart';

class CancelOrder {
  final BaseOrderDetailsRepository baseOrderDetailsRepository;

  CancelOrder(this.baseOrderDetailsRepository);

  Future<Either<Failure, bool>> execute(int orderId, String cancelReason) async {
    return await baseOrderDetailsRepository.cancelOrder(orderId , cancelReason);
  }
}
