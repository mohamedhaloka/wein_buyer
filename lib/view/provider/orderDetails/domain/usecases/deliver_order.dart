import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/provider/orderDetails/domain/repository/base_order_details_repository.dart';
import '../../../../../../core/error/failure.dart';

class DeliverOrder {
  final BaseOrderDetailsRepository baseOrderDetailsRepository;

  DeliverOrder(this.baseOrderDetailsRepository);

  Future<Either<Failure, bool>> execute(int orderId, String pricePaid) async {
    return await baseOrderDetailsRepository.deliverOrder(orderId , pricePaid);
  }
}
