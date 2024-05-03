import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wein_buyer/core/models/size_guides_model.dart';
import '../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/models/error_message_model.dart';
import '../../../../../../core/utils/app_strings.dart';

abstract class BaseSizeGuideRemoteDatasource {
  Future<List<SizeGuides>> getSizeGuides();

  Future<SizeGuides> addSizeGuide(String name, File image);

  Future<SizeGuides> editSizeGuide(int sizeGuideId, String name, File image);

  Future<bool> deleteSizeGuide(int sizeGuideId);
}

class SizeGuideRemoteDatasource extends BaseSizeGuideRemoteDatasource {
  @override
  Future<List<SizeGuides>> getSizeGuides() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointSizeGuides}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getSizeGuides");
      }
      return SizeGuidesModel.fromJson(response.data).sizeGuides ?? [];
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<SizeGuides> addSizeGuide(String name, File image) async {
    MultipartFile multipartFile = await MultipartFile.fromFile(image.path,
        filename: image.path.split('/').last);
    final response = await DioHelper.post(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointAddSizeGuides}",
      body: {
        "name": name,
        "image": multipartFile,
      },
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success addSizeGuide");
      }
      return SizeGuides.fromJson(response.data['body']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<SizeGuides> editSizeGuide(
      int sizeGuideId, String name, File image) async {
    MultipartFile multipartFile = await MultipartFile.fromFile(image.path,
        filename: image.path.split('/').last);
    final response = await DioHelper.post(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointUpdateSizeGuides}$sizeGuideId/update",
      body: {
        "name": name,
        "image": multipartFile,
      },
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success editSizeGuide");
      }
      return SizeGuides.fromJson(response.data['body']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<bool> deleteSizeGuide(int sizeGuideId) async {
    final response = await DioHelper.delete(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointDeleteSizeGuides}$sizeGuideId/delete",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success deleteSizeGuide");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
