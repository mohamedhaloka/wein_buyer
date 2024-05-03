import 'package:flutter/foundation.dart';
import 'package:wein_buyer/core/models/categories_model.dart';
import 'package:wein_buyer/core/models/product_details_model.dart';
import 'package:wein_buyer/core/models/products_model.dart';
import '../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/models/add_product_model.dart';
import '../../../../../../core/models/error_message_model.dart';
import '../../../../../../core/utils/app_strings.dart';

abstract class BaseReturnPolicyRemoteDatasource {
  Future<String> getReturnPolicy();
  Future<bool> updateReturnPolicy(String content);
}

class ReturnPolicyRemoteDatasource extends BaseReturnPolicyRemoteDatasource {
  @override
  Future<String> getReturnPolicy() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointReturnPolicy}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getReturnPolicy");
      }
      return response.data['body'];
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<bool> updateReturnPolicy(String content) async{
    final response = await DioHelper.post(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointUpdateReturnPolicy}",
      body: {
        'content' : content
      }
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success updateReturnPolicy");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

}
