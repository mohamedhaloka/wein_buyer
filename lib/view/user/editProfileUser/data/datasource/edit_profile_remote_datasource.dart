import 'package:flutter/foundation.dart';
import 'package:wein_buyer/view/user/editProfileUser/data/model/edit_profile_data_model.dart';
import '../../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/models/error_message_model.dart';
import '../../../../../../../core/models/profile_model.dart';
import '../../../../../../../core/models/user_user_model.dart';
import '../../../../../../../core/utils/app_strings.dart';

abstract class BaseEditProfileRemoteDatasource {
  Future<ProfileModel> getProfileData();

  Future<UserUserModel> updateProfileData(EditProfileDataModel editProfileDataModel);

  Future<bool> updatePassword(
      String oldPass, String newPass, String confirmPass);

  Future<bool> deleteAccount();
}

class EditProfileRemoteDatasource extends BaseEditProfileRemoteDatasource {
  @override
  Future<ProfileModel> getProfileData() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointProfile}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getProfileData");
      }
      return ProfileModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<UserUserModel> updateProfileData(
      EditProfileDataModel editProfileDataModel) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurl}${AppStrings.endpointUpdateProfile}",
      body: await editProfileDataModel.toJson(),
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success updateProfileData");
      }
      return UserUserModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<bool> updatePassword(
      String oldPass, String newPass, String confirmPass) async{
    final response = await DioHelper.post(
      "${AppStrings.baseurl}${AppStrings.endpointUpdatePassword}",
      body: {
        "old_password" : oldPass,
        "password" : newPass,
        "password_confirmation" : confirmPass,
      },
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success updatePassword");
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
