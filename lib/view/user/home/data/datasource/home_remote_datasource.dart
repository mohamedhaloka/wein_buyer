
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:wein_buyer/core/models/home_model.dart';
import '../../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/models/error_message_model.dart';
import '../../../../../../../core/utils/app_strings.dart';

abstract class BaseHomeRemoteDatasource {
  Future<HomeModel> getHomeData();
}

class HomeRemoteDatasource extends BaseHomeRemoteDatasource {
  @override
  Future<HomeModel> getHomeData() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointHome}"
    );
    print(response.data);
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getHomeData");
        log(response.data['body'].toString());
      }
      return HomeModel.fromJson(response.data);
    } else {
      log(response.data);
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
