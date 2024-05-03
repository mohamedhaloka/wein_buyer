import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/cart_model.dart';
import '../../../../../../../../core/error/failure.dart';

abstract class BaseCartRepository {
  Future<Either<Failure, Cart>> getCart();
  Future<Either<Failure, Cart>> updateItemQuantity(String itemId, int quantity);
  Future<Either<Failure, Cart>> removeItem(String itemId);
  Future<Either<Failure, bool>> checkout(int addressId);
}
