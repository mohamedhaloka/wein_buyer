import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wein_buyer/core/models/orders_model.dart';
import 'package:wein_buyer/core/models/size_guides_model.dart';
import '../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/models/error_message_model.dart';
import '../../../../../../core/utils/app_strings.dart';

abstract class BaseOrdersRemoteDatasource {
  Future<OrdersModel> getOrders(String status);
}

class OrdersRemoteDatasource extends BaseOrdersRemoteDatasource {
  @override
  Future<OrdersModel> getOrders(status) async {
    final response = await DioHelper.get(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointOrders}?status=$status",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getOrders$status");
      }
      return OrdersModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
