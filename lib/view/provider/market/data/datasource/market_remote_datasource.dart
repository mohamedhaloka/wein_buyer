import 'package:flutter/foundation.dart';
import 'package:wein_buyer/core/models/categories_model.dart';
import 'package:wein_buyer/core/models/products_provider_model.dart';
import 'package:wein_buyer/core/models/profile_provider_model.dart';
import 'package:wein_buyer/view/provider/market/data/model/edit_market_details.dart';
import '../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/models/error_message_model.dart';
import '../../../../../../core/models/my_rates_model.dart';
import '../../../../../../core/models/sub_categories_provider_model.dart';
import '../../../../../../core/utils/app_strings.dart';

abstract class BaseMarketRemoteDatasource {
  Future<ProfileModel> getProfileData();
  Future<CategoriesModel> getAllCategories();

  Future<SubCategoriesModel> getSubCategories(int cateId);

  Future<ProductsModel> getProducts(int cateId);

  Future<MyRatesModel> getMyRate();

  Future<bool> deleteProduct(int productId);

  Future<bool> editMarketDetails(EditMarketDetailsModel editMarketDetailsModel);
}

class MarketRemoteDatasource extends BaseMarketRemoteDatasource {
  @override
  Future<ProfileModel> getProfileData() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointEditProfileData}",
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
  Future<SubCategoriesModel> getSubCategories(int cateId) async {
    final response = await DioHelper.get(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointCategories}?parent_id=$cateId",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getSubCategories");
      }
      return SubCategoriesModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<CategoriesModel> getAllCategories() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointCategories}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getAllCategories");
      }
      return CategoriesModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ProductsModel> getProducts(int cateId) async {
    final response = await DioHelper.get(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointProducts}/me?category_id=$cateId",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getProducts");
      }
      return ProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MyRatesModel> getMyRate() async {
    final response = await DioHelper.get("${AppStrings.baseurlMerchant}${AppStrings.endpointMyRates}");
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getMyRate");
      }
      return MyRatesModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<bool> deleteProduct(int productId) async {
    final response = await DioHelper.delete(
        "${AppStrings.baseurlMerchant}${AppStrings.endpointDeleteProduct}$productId/delete");
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success deleteProduct");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<bool> editMarketDetails(
      EditMarketDetailsModel editMarketDetailsModel) async {
    final response = await DioHelper.post("${AppStrings.baseurlMerchant}${AppStrings.endpointEditMarketDetails}",
        body: await editMarketDetailsModel.toJson());
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success editMarketDetails");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
