import 'package:dartz/dartz.dart';
import '../../../../../../../../core/error/exception.dart';
import '../../../../../../../../core/error/failure.dart';
import '../../../../../../../../core/models/cart_model.dart';
import '../../domain/repository/base_cart_repository.dart';
import '../datasource/cart_remote_datasource.dart';

class CartRepository extends BaseCartRepository {
  final BaseCartRemoteDatasource baseCartRemoteDatasource;

  CartRepository(this.baseCartRemoteDatasource);

  @override
  Future<Either<Failure, bool>> checkout(int addressId) async{
    try {
      final res = await baseCartRemoteDatasource.checkout(addressId);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, Cart>> getCart() async{
    try {
      final res = await baseCartRemoteDatasource.getCart();
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, Cart>> updateItemQuantity(String itemId, int quantity) async{
    try {
      final res = await baseCartRemoteDatasource.updateItemQuantity(itemId, quantity);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, Cart>> removeItem(String itemId) async{
    try {
      final res = await baseCartRemoteDatasource.removeItem(itemId);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }
}
