import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wein_buyer/core/models/user_provider_model.dart';

import '../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/models/error_message_model.dart';
import '../../../../../../core/models/user_user_model.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../model/register_model.dart';

abstract class BaseRegisterRemoteDatasource {
  Future<UserProviderModel> register(RegisterModel registerModel);
}

class RegisterRemoteDatasource extends BaseRegisterRemoteDatasource {
  @override
  Future<UserProviderModel> register(registerModel) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointRegister}",
      body: await registerModel.toJson(),
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success RegisterRepo");
      }
      return UserProviderModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
