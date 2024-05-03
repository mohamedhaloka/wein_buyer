import 'package:flutter/foundation.dart';
import 'package:wein_buyer/core/models/addresses_model.dart';
import '../../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/models/error_message_model.dart';
import '../../../../../../../core/models/favorites_model.dart';
import '../../../../../../../core/models/user_user_model.dart';
import '../../../../../../../core/utils/app_strings.dart';

abstract class BaseFavoritesRemoteDatasource {
  Future<FavoritesModel> getFavorites();

  Future<bool> addFavoriteItem(int productId);

  Future<bool> removeFavoriteItem(int productId);
}

class FavoritesRemoteDatasource extends BaseFavoritesRemoteDatasource {
  @override
  Future<FavoritesModel> getFavorites() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointFavorites}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getFavorites");
      }
      return FavoritesModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<bool> addFavoriteItem(int productId) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurl}${AppStrings.endpointFavorites}/$productId/add",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success addFavoriteItem");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<bool> removeFavoriteItem(int productId) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurl}${AppStrings.endpointFavorites}/$productId/remove",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success removeFavoriteItem");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
