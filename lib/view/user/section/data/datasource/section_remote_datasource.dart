import 'package:flutter/foundation.dart';
import 'package:wein_buyer/core/models/addresses_model.dart';
import 'package:wein_buyer/core/models/main_categories_model.dart';
import 'package:wein_buyer/core/models/sub_categories_model.dart';
import '../../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/models/error_message_model.dart';
import '../../../../../../../core/models/favorites_model.dart';
import '../../../../../../../core/models/user_user_model.dart';
import '../../../../../../../core/utils/app_strings.dart';

abstract class BaseSectionRemoteDatasource {
  Future<MainCategoriesModel> getMainCates();

  Future<SubCategoriesModel> getSubCatesAndTopRatedProducts(int cateId);
}

class SectionRemoteDatasource extends BaseSectionRemoteDatasource {
  @override
  Future<SubCategoriesModel> getSubCatesAndTopRatedProducts(int cateId) async {
    print("${AppStrings.baseurl}${AppStrings.endpointCategories}/$cateId/show");
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointCategories}/$cateId/show",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getSubCatesAndTopRatedProducts");
      }
      return SubCategoriesModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MainCategoriesModel> getMainCates() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointCategories}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getMainCates");
      }
      return MainCategoriesModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
