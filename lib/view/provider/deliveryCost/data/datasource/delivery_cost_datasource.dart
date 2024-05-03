import 'package:flutter/foundation.dart';
import '../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/models/error_message_model.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../core/models/delivery_cost_model.dart';
import '../models/delivery_cost_services_model.dart';

abstract class BaseDeliveryCostRemoteDatasource {
  Future<DeliveryCostModel> getDeliveryCost();

  Future<bool> updateDeliveryCost(DeliveryCostServicesModel deliveryCostServicesModel);
}

class DeliveryCostRemoteDatasource extends BaseDeliveryCostRemoteDatasource {
  @override
  Future<DeliveryCostModel> getDeliveryCost() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointDeliveryCost}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getDeliveryCost");
      }
      return DeliveryCostModel.fromJson(response.data['body']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<bool> updateDeliveryCost(
      DeliveryCostServicesModel deliveryCostServicesModel) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurlMerchant}${AppStrings.endpointUpdateDeliveryCost}",
      body: deliveryCostServicesModel.toJson(),
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success updateDeliveryCost");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
