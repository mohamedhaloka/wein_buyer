import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/models/error_message_model.dart';
import '../../../../../../../core/models/user_user_model.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../model/register_model.dart';

abstract class BaseRegisterUserRemoteDatasource {
  Future<UserUserModel> register(RegisterModel registerModel);
}

class RegisterUserRemoteDatasource extends BaseRegisterUserRemoteDatasource {
  @override
  Future<UserUserModel> register(registerModel) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurl}${AppStrings.endpointRegister}",
      body: await registerModel.toJson(),
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success RegisterRepo");
      }
      return UserUserModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
