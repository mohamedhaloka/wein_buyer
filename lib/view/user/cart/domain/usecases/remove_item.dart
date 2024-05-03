import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/cart_model.dart';
import 'package:wein_buyer/view/user/cart/domain/repository/base_cart_repository.dart';

import '../../../../../../../../core/error/failure.dart';

class RemoveItem {
  final BaseCartRepository baseCartRepository;

  RemoveItem(this.baseCartRepository);

  Future<Either<Failure, Cart>> execute(String itemId) async {
    return await baseCartRepository.removeItem(itemId);
  }
}
