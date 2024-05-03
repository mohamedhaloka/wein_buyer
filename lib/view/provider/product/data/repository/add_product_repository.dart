import 'package:dartz/dartz.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/add_product_model.dart';
import '../../../../../../core/models/product_details_model.dart';
import '../../domain/repository/base_add_product_repository.dart';
import '../datasource/add_product_remote_datasource.dart';

class AddProductRepository extends BaseAddProductRepository {
  final BaseAddProductRemoteDatasource baseAddProductRemoteDatasource;

  AddProductRepository(this.baseAddProductRemoteDatasource);

  @override
  Future<Either<Failure, ProductDetailsModel>> addProduct(
      AddProductModel addProductModel) async {
    try {
      final res =
          await baseAddProductRemoteDatasource.addProduct(addProductModel);
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
  Future<Either<Failure, ProductDetailsModel>> editProduct(
      AddProductModel addProductModel, int productId) async {
    try {
      final res = await baseAddProductRemoteDatasource.editProduct(
          addProductModel, productId);
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
  Future<Either<Failure, bool>> deleteImages(
      int productId, String imgUrl) async {
    try {
      final res =
          await baseAddProductRemoteDatasource.deleteImages(productId, imgUrl);
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
