import 'package:flutter/foundation.dart';
import 'package:wein_buyer/core/models/cart_model.dart';
import 'package:wein_buyer/core/models/notification_model.dart';
import '../../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/models/error_message_model.dart';
import '../../../../../../../core/utils/app_strings.dart';

abstract class BaseNotificationRemoteDatasource {
  Future<NotificationModel> getNotification();
}

class NotificationRemoteDatasource extends BaseNotificationRemoteDatasource {
  @override
  Future<NotificationModel> getNotification() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointNotifications}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getNotification");
      }
      return NotificationModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
