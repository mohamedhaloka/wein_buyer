import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/provider/orderDetails/domain/repository/base_order_details_repository.dart';
import '../../../../../../core/error/failure.dart';

class RejectOrder {
  final BaseOrderDetailsRepository baseOrderDetailsRepository;

  RejectOrder(this.baseOrderDetailsRepository);

  Future<Either<Failure, bool>> execute(int orderId, String rejectReason) async {
    return await baseOrderDetailsRepository.rejectOrder(orderId , rejectReason);
  }
}
