import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/products_model.dart';
import '../../domain/repository/base_products_repository.dart';
import '../datasource/products_remote_datasource.dart';

class ProductsRepository extends BaseProductsRepository {
  final BaseProductsRemoteDatasource baseSectionRemoteDatasource;

  ProductsRepository(this.baseSectionRemoteDatasource);

  @override
  Future<Either<Failure, ProductsModel>> getFreeDelivery(int page) async {
    try {
      final res = await baseSectionRemoteDatasource.getFreeDelivery(page);
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
  Future<Either<Failure, ProductsModel>> getAllOffers(int page) async {
    try {
      final res = await baseSectionRemoteDatasource.getAllOffers(page);
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
  Future<Either<Failure, ProductsModel>> getProductBySortMaxAndMin(
      int subCateId,
      String maxPrice,
      String minPrice,
      String minDistance,
      String maxDistance) async {
    try {
      final res = await baseSectionRemoteDatasource.getProductBySortMaxAndMin(
          subCateId, maxPrice, minPrice, minDistance, maxDistance);
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
  Future<Either<Failure, ProductsModel>> getProductBySortFilter(
      int subCateId, String keyOfFilter) async {
    try {
      final res = await baseSectionRemoteDatasource.getProductBySortFilter(
          subCateId, keyOfFilter);
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
  Future<Either<Failure, ProductsModel>> getProductBySubCategory(
      int subCateId) async {
    try {
      final res =
          await baseSectionRemoteDatasource.getProductBySubCategory(subCateId);
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
