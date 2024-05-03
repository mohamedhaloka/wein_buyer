import 'package:dartz/dartz.dart';

import '../../../../../../../../core/error/failure.dart';
import '../repository/base_cart_repository.dart';

class Checkout {
  final BaseCartRepository baseCartRepository;

  Checkout(this.baseCartRepository);

  Future<Either<Failure, bool>> execute(int addressId) async {
    return await baseCartRepository.checkout(addressId);
  }
}
