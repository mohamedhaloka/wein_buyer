import 'package:flutter/foundation.dart';
import 'package:wein_buyer/core/models/products_model.dart';
import '../../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/models/error_message_model.dart';
import '../../../../../../../core/utils/app_strings.dart';

abstract class BaseProductsRemoteDatasource {
  Future<ProductsModel> getProductBySubCategory(int subCateId);

  Future<ProductsModel> getProductBySortFilter(
      int subCateId, String keyOfFilter);

  Future<ProductsModel> getProductBySortMaxAndMin(int subCateId,
      String maxPrice, String minPrice, String minDistance, String maxDistance);

  Future<ProductsModel> getAllOffers(int page);

  Future<ProductsModel> getFreeDelivery(int page);
}

class ProductsRemoteDatasource extends BaseProductsRemoteDatasource {
  @override
  Future<ProductsModel> getFreeDelivery(int page) async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointAllFreeDelivery}?page=$page",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getFreeDelivery");
      }
      return ProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ProductsModel> getAllOffers(int page) async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointAllOffers}?page=$page",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getAllOffers");
      }
      return ProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ProductsModel> getProductBySortMaxAndMin(
      int subCateId,
      String maxPrice,
      String minPrice,
      String minDistance,
      String maxDistance) async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointProductsBySubCategories}/$subCateId?max_price=$maxPrice&min_price=$minPrice&min_distance=$minDistance&max_distance=$maxDistance",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getProductBySortMaxAndMin");
      }
      return ProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ProductsModel> getProductBySortFilter(
      int subCateId, String keyOfFilter) async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointProductsBySubCategories}/$subCateId?sortBy=$keyOfFilter",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getProductBySortFilter");
      }
      return ProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ProductsModel> getProductBySubCategory(int subCateId) async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointProductsBySubCategories}/$subCateId",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getProductBySubCategory");
      }
      return ProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
