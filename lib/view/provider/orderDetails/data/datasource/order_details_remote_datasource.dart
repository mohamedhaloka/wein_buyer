import 'package:flutter/foundation.dart';
import '../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/models/error_message_model.dart';
import '../../../../../../core/utils/app_strings.dart';

abstract class BaseOrderDetailsRemoteDatasource {
  Future<bool> acceptOrder(int orderId);

  Future<bool> rejectOrder(int orderId, String rejectReason);
  Future<bool> cancelOrder(int orderId, String cancelReason);

  Future<bool> deliverOrder(int orderId, String pricePaid);
}

class OrderDetailsRemoteDatasource extends BaseOrderDetailsRemoteDatasource {
  @override
  Future<bool> deliverOrder(orderId, pricePaid) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointOrders}/$orderId/deliver",
      body: {
        'price_paid': pricePaid,
      },
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success deliverOrder");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<bool> cancelOrder(orderId, cancelReason) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointOrders}/$orderId/cancel",
      body: {
        'cancel_reason': cancelReason,
      },
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

  @override
  Future<bool> rejectOrder(orderId, rejectReason) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointOrders}/$orderId/reject",
      body: {
        'reject_reason': rejectReason,
      },
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success rejectOrder");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<bool> acceptOrder(orderId) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointOrders}/$orderId/accept",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success acceptOrder");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
