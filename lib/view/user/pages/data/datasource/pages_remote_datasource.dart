import 'package:flutter/foundation.dart';
import 'package:wein_buyer/core/models/addresses_model.dart';
import 'package:wein_buyer/core/models/currencies_model.dart';
import 'package:wein_buyer/core/models/privacy_policy_model.dart';
import 'package:wein_buyer/core/models/terms_model.dart';
import '../../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/models/error_message_model.dart';
import '../../../../../../../core/models/favorites_model.dart';
import '../../../../../../../core/models/fqs_model.dart';
import '../../../../../../../core/models/user_user_model.dart';
import '../../../../../../../core/utils/app_strings.dart';

abstract class BasePagesRemoteDatasource {
  Future<FqsModel> getFaqs();
  Future<TermsModel> getTerms();
  Future<PrivacyPolicyModel> getPrivacyPolicy();
  Future<CurrenciesModel> getCurrencies();
}

class PagesRemoteDatasource extends BasePagesRemoteDatasource {
  @override
  Future<PrivacyPolicyModel> getPrivacyPolicy() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointPrivacyPolicy}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getPrivacyPolicy");
      }
      return PrivacyPolicyModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<TermsModel> getTerms() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointTerms}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getTerms");
      }
      return TermsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<FqsModel> getFaqs() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointFaqs}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getFaqs");
      }
      return FqsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<CurrenciesModel> getCurrencies() async{
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointCurrencies}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getCurrencies");
      }
      return CurrenciesModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
