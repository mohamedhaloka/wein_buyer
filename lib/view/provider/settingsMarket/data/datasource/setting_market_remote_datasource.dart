import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/models/error_message_model.dart';
import '../../../../../../core/models/user_user_model.dart';
import '../../../../../../core/utils/app_strings.dart';

abstract class BaseSettingMarketRemoteDatasource {
  Future<bool> toggleOpenStatus();
}

class SettingMarketRemoteDatasource extends BaseSettingMarketRemoteDatasource {
  @override
  Future<bool> toggleOpenStatus() async {
    final response = await DioHelper.post(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointToggleOpenStatus}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success toggleOpenStatus");
      }
      return response.data['body']['status'];
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
