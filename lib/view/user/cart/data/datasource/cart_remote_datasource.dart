import 'package:flutter/foundation.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/core/models/cart_model.dart';
import '../../../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../../../core/error/exception.dart';
import '../../../../../../../../core/models/error_message_model.dart';
import '../../../../../../../../core/utils/app_strings.dart';

abstract class BaseCartRemoteDatasource {
  Future<Cart> getCart();

  Future<Cart> updateItemQuantity(String itemId, int quantity);

  Future<Cart> removeItem(String itemId);

  Future<bool> checkout(int addressId);
}

class CartRemoteDatasource extends BaseCartRemoteDatasource {
  @override
  Future<bool> checkout(int addressId) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurl}${AppStrings.endpointCheckout}",
      body: {
        'address_id': addressId,
      },
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success checkout");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<Cart> removeItem(String itemId) async {
    final response = await DioHelper.delete(
      "${AppStrings.baseurl}${AppStrings.endpointRemoveItem}",
      body: {
        'item_id': itemId,
      },
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success removeItem");
      }
      return Cart.fromJson(response.data['body']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<Cart> updateItemQuantity(String itemId, int quantity) async {
    final response = await DioHelper.post(
        "${AppStrings.baseurl}${AppStrings.endpointUpdateItemQuantity}",
        body: {'item_id': itemId, 'quantity': quantity});
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success updateItemQuantity");
      }
      return Cart.fromJson(response.data['body']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<Cart> getCart() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointCart}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print(response.data);
        print("Success getCart");
      }
      return Cart.fromJson(response.data['body']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
