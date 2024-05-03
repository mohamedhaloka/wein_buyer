import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/models/error_message_model.dart';
import '../../../../../../core/models/sizes_model.dart';
import '../../../../../../core/utils/app_strings.dart';

abstract class BaseUtilsRemoteDatasource {
  Future<SizesModel> getSizes();

  Future<bool> getVerifiedStatus();
}

class UtilsRemoteDatasource extends BaseUtilsRemoteDatasource {
  @override
  Future<SizesModel> getSizes() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointSizes}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getSizes");
      }
      return SizesModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<bool> getVerifiedStatus() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointGetVerifiedStatus}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getVerifiedStatus");
      }
      if (response.data['body']['status'] == 1) {
        return true;
      } else {
        return false;
      }
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
