import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:wein_buyer/core/models/products_model.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/categories_item_model.dart';
import '../../../../../../../core/models/market_details_model.dart';
import '../../../../../../../core/models/product_details.dart';
import '../../../../../../../core/models/related_products_model.dart';
import '../../domain/repository/base_product_details_repository.dart';
import '../datasource/product_details_remote_datasource.dart';

class ProductDetailsRepository extends BaseProductDetailsRepository {
  final BaseProductDetailsRemoteDatasource baseProductDetailsRemoteDatasource;

  ProductDetailsRepository(this.baseProductDetailsRemoteDatasource);

  @override
  Future<Either<Failure, ProductsModel>> getMarketProducts(int marketId, int categoryId) async {
    try {
      final res = await baseProductDetailsRemoteDatasource.getMarketProducts(marketId , categoryId);
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
  Future<Either<Failure, CategoriesItemModel>> getMarketCategories(int marketId) async {
    try {
      final res = await baseProductDetailsRemoteDatasource.getMarketCategories(marketId);
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
  Future<Either<Failure, MarketDetails>> getMarketDetails(int marketId) async {
    try {
      final res = await baseProductDetailsRemoteDatasource.getMarketDetails(marketId);
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
  Future<Either<Failure, bool>> addToCart(
      int productId, int quantity, String color, String size , double lat, double lng) async {
    try {
      final res = await baseProductDetailsRemoteDatasource.addToCart(
          productId, quantity, color, size , lat , lng);
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
  Future<Either<Failure, RelatedProductsModel>> getRelatedProducts(
      int productId) async {
    try {
      final res = await baseProductDetailsRemoteDatasource
          .getRelatedProducts(productId);
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
  Future<Either<Failure, ProductDetails>> getProductDetails(
      int productId) async {
    try {
      final res =
          await baseProductDetailsRemoteDatasource.getProductDetails(productId);
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
