import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/models/error_message_model.dart';
import '../../../../../../core/models/user_user_model.dart';
import '../../../../../../core/utils/app_strings.dart';

abstract class BaseAccountRemoteDatasource {
  Future<bool> contactUs(String name, String email,String phone, String msg);
  Future<bool> deleteAccount();
}

class AccountRemoteDatasource extends BaseAccountRemoteDatasource {
  @override
  Future<bool> contactUs(name, email, phone, msg) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointContactUs}",
      body: {
        "name": name,
        "email": email,
        "phone": phone,
        "message": msg,
      },
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success contactUs");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<bool> deleteAccount() async{
    final response = await DioHelper.post(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointDeleteAccount}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success deleteAccount");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
