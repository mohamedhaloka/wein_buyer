import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/provider/orderDetails/domain/repository/base_order_details_repository.dart';
import '../../../../../../core/error/failure.dart';

class AcceptOrder {
  final BaseOrderDetailsRepository baseOrderDetailsRepository;

  AcceptOrder(this.baseOrderDetailsRepository);

  Future<Either<Failure, bool>> execute(int orderId) async {
    return await baseOrderDetailsRepository.acceptOrder(orderId);
  }
}
