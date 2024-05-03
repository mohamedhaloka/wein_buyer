import 'package:flutter/foundation.dart';
import 'package:wein_buyer/core/models/addresses_model.dart';
import 'package:wein_buyer/core/models/main_categories_model.dart';
import 'package:wein_buyer/core/models/products_by_filter_model.dart';
import 'package:wein_buyer/core/models/products_model.dart';
import 'package:wein_buyer/core/models/sub_categories_model.dart';
import '../../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/models/error_message_model.dart';
import '../../../../../../../core/models/favorites_model.dart';
import '../../../../../../../core/models/orders_model.dart';
import '../../../../../../../core/models/user_user_model.dart';
import '../../../../../../../core/utils/app_strings.dart';

abstract class BaseMyOrdersRemoteDatasource {
  Future<OrdersModel> getMyOrders(String status);

  Future<bool> rateProduct(int productId, double rate, String text);
}

class MyOrdersRemoteDatasource extends BaseMyOrdersRemoteDatasource {
  @override
  Future<OrdersModel> getMyOrders(String status) async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointOrders}?status=$status",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getMyOrders");
      }
      return OrdersModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<bool> rateProduct(int productId, double rate, String text) async {
    final response = await DioHelper.post(
        "${AppStrings.baseurl}${AppStrings.endpointRates}/$productId/rate",
        body: {
          'rate': rate,
          'text': text,
        });
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success rateProduct");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
