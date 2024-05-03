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

abstract class BaseOrderDetailsUserRemoteDatasource {
  Future<bool> cancelOrder(int orderId);
}

class OrderDetailsUserRemoteDatasource extends BaseOrderDetailsUserRemoteDatasource {
  @override
  Future<bool> cancelOrder(int orderId) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurl}${AppStrings.endpointOrders}/$orderId/cancel",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success cancelOrder");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
