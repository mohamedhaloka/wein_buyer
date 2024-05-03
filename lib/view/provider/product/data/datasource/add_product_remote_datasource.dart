import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:wein_buyer/core/models/product_details_model.dart';
import 'package:wein_buyer/core/models/products_model.dart';
import '../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/models/error_message_model.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../core/models/add_product_model.dart';

abstract class BaseAddProductRemoteDatasource {
  Future<ProductDetailsModel> addProduct(AddProductModel addProductModel);

  Future<ProductDetailsModel> editProduct(
      AddProductModel addProductModel, int productId);

  Future<bool> deleteImages(int productId, String imgUrl);
}

class AddProductRemoteDatasource extends BaseAddProductRemoteDatasource {
  @override
  Future<ProductDetailsModel> addProduct(
      AddProductModel addProductModel) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointAddProduct}",
      body: await addProductModel.toJson(),
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success addProduct");
      }
      return ProductDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ProductsModel> getProducts(int cateId) async {
    final response = await DioHelper.get(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointProducts}?category_id=$cateId",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getProducts");
      }
      return ProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ProductDetailsModel> editProduct(
      AddProductModel addProductModel, int productId) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointProductsMerchant}/$productId/update",
      body: await addProductModel.toJson(),
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success editProduct");
      }
      return ProductDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<bool> deleteImages(int productId, String imgUrl) async {
    print(imgUrl);
    print(productId);
    final response = await DioHelper.delete(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointProductsMerchant}/$productId/delete_image?image=$imgUrl",
    );
    print(response.data);
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success deleteImages");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
