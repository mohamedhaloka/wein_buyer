import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/cart_model.dart';
import 'package:wein_buyer/view/user/cart/domain/repository/base_cart_repository.dart';

import '../../../../../../../../core/error/failure.dart';

class UpdateItemQuantity {
  final BaseCartRepository baseCartRepository;

  UpdateItemQuantity(this.baseCartRepository);

  Future<Either<Failure, Cart>> execute(String itemId, int quantity) async {
    return await baseCartRepository.updateItemQuantity(itemId, quantity);
  }
}
