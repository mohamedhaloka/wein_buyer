import 'package:flutter/foundation.dart';
import '../../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/models/error_message_model.dart';
import '../../../../../../../core/models/forget_password_model.dart';
import '../../../../../../../core/models/msg_model.dart';
import '../../../../../../../core/utils/app_strings.dart';

abstract class BaseForgetPasswordUserRemoteDatasource {
  Future<ForgetPasswordModel> forgetPassword(String email);

  Future<ForgetPasswordModel> verificationCode(String code);

  Future<MsgModel> changePassword(
      String code, String password, String passwordConfirmation);
}

class ForgetPasswordUserRemoteDatasource
    extends BaseForgetPasswordUserRemoteDatasource {
  @override
  Future<MsgModel> changePassword(code, password, passwordConfirmation) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurl}${AppStrings.endpointChangePassword}",
      body: {
        "code": code,
        "password": password,
        "password_confirmation": passwordConfirmation,
      },
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success changePassword");
      }
      return MsgModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ForgetPasswordModel> verificationCode(code) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurl}${AppStrings.endpointVerificationCode}",
      body: {
        "code": code,
      },
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success verificationCode");
      }
      return ForgetPasswordModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ForgetPasswordModel> forgetPassword(email) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurl}${AppStrings.endpointForgetPassword}",
      body: {
        "email": email,
      },
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success forgetPassword");
      }
      return ForgetPasswordModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
