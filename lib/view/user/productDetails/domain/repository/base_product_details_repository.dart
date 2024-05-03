import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:wein_buyer/core/models/products_model.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/categories_item_model.dart';
import '../../../../../../../core/models/market_details_model.dart';
import '../../../../../../../core/models/product_details.dart';
import '../../../../../../../core/models/related_products_model.dart';

abstract class BaseProductDetailsRepository {
  Future<Either<Failure, ProductDetails>> getProductDetails(int productId);

  Future<Either<Failure, RelatedProductsModel>> getRelatedProducts(
      int productId);

  Future<Either<Failure, bool>> addToCart(
      int productId, int quantity, String color, String size , double lat, double lng);

  Future<Either<Failure, MarketDetails>> getMarketDetails(int marketId);

  Future<Either<Failure, CategoriesItemModel>> getMarketCategories(int marketId);
  Future<Either<Failure, ProductsModel>> getMarketProducts(int marketId, int categoryId);
}
