import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wein_buyer/core/models/categories_item_model.dart';
import 'package:wein_buyer/core/models/market_details_model.dart';
import 'package:wein_buyer/core/models/products_model.dart';
import '../../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/models/error_message_model.dart';
import '../../../../../../../core/models/product_details.dart';
import '../../../../../../../core/models/related_products_model.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../../../../core/appStorage/app_storage.dart';
import '../../../../../core/notifications/notification_service.dart';
import '../../../addresses/presentation/controller/addresses_cubit.dart';

abstract class BaseProductDetailsRemoteDatasource {
  Future<ProductDetails> getProductDetails(int productId);

  Future<RelatedProductsModel> getRelatedProducts(int productId);

  Future<bool> addToCart(int productId, int quantity, String color, String size,
      double lat, double lng);

  Future<MarketDetails> getMarketDetails(int marketId);

  Future<CategoriesItemModel> getMarketCategories(int marketId);

  Future<ProductsModel> getMarketProducts(int marketId, int categoryId);
}

class ProductDetailsRemoteDatasource
    extends BaseProductDetailsRemoteDatasource {
  @override
  Future<ProductsModel> getMarketProducts(int marketId, int categoryId) async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointMerchant}/$marketId/categories/$categoryId/products",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getMarketProducts");
      }
      return ProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<CategoriesItemModel> getMarketCategories(int marketId) async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointMerchant}/$marketId/categories",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getMarketCategories");
      }
      return CategoriesItemModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MarketDetails> getMarketDetails(int marketId) async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointMerchant}/$marketId/show",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getMarketDetails");
      }
      return MarketDetails.fromJson(response.data['body']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<bool> addToCart(int productId, int quantity, String color, String size,
      double lat, double lng) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurl}${AppStrings.endpointCart}",
      body: {
        "product_id": productId,
        "quantity": quantity,
        "properties": {
          "color": color,
          "size": size,
        },
        "lat": lat,
        "lng": lng,
      },
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success addToCart");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<RelatedProductsModel> getRelatedProducts(int productId) async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointProducts}/$productId/related_products",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getRelatedProducts");
      }
      return RelatedProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ProductDetails> getProductDetails(int productId) async {
    print(
        "${AppStrings.baseurl}${AppStrings.endpointProducts}/$productId/show");
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointProducts}/$productId/show",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getProductDetails");
      }
      return ProductDetails.fromJson(response.data['body']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
