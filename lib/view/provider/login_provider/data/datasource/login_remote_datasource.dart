import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/models/error_message_model.dart';
import '../../../../../../core/models/user_provider_model.dart';
import '../../../../../../core/utils/app_strings.dart';

abstract class BaseLoginRemoteDatasource {
  Future<UserProviderModel> login(String email, String password);
}

class LoginRemoteDatasource extends BaseLoginRemoteDatasource {
  @override
  Future<UserProviderModel> login(email, password) async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    final String? token = await firebaseMessaging.getToken();
    final response = await DioHelper.post(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointLogin}",
      body: {
        "email": email,
        "password": password,
        "fcm_token": token,
      },
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success LoginRepo");
      }
      return UserProviderModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
