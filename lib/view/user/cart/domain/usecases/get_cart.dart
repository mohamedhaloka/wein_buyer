import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/cart_model.dart';
import 'package:wein_buyer/view/user/cart/domain/repository/base_cart_repository.dart';

import '../../../../../../../../core/error/failure.dart';

class GetCart {
  final BaseCartRepository baseCartRepository;

  GetCart(this.baseCartRepository);

  Future<Either<Failure, Cart>> execute() async {
    return await baseCartRepository.getCart();
  }
}
