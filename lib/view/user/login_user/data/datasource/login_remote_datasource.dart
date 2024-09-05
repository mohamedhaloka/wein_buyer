
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import '../../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/models/error_message_model.dart';
import '../../../../../../../core/models/user_user_model.dart';
import '../../../../../../../core/utils/app_strings.dart';

abstract class BaseLoginUserRemoteDatasource {
  Future<UserUserModel> login(String phone, String password);
}

class LoginUserRemoteDatasource extends BaseLoginUserRemoteDatasource {
  @override
  Future<UserUserModel> login(phone, password) async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    final String? token = await firebaseMessaging.getToken();
    final response = await DioHelper.post(
      "${AppStrings.baseurl}${AppStrings.endpointLogin}",
      body: {
        "phone": phone,
        "password": password,
        "fcm_token": token,
      },
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success LoginRepo");
      }
      return UserUserModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
