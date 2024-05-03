import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:wein_buyer/core/models/addresses_model.dart';
import '../../../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/models/error_message_model.dart';
import '../../../../../../../core/utils/app_strings.dart';

abstract class BaseAddressesRemoteDatasource {
  Future<bool> deleteAddress(int addressId);

  Future<Address> makeDefaultAddress(int addressId);

  Future<Address> addAddress(double lat, double lng, String address,
      String nearestAddress, String recipientName, String phone);

  Future<Address> editAddress(
      int addressId,
      double lat,
      double lng,
      String address,
      String nearestAddress,
      String recipientName,
      String phone);

  Future<AddressesModel> getAddresses();
}

class AddressesRemoteDatasource extends BaseAddressesRemoteDatasource {
  @override
  Future<Address> makeDefaultAddress(int addressId) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurl}${AppStrings.endpointAddresses}/$addressId/make_default",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success makeDefaultAddress");
      }
      return Address.fromJson(response.data['body']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<bool> deleteAddress(int addressId) async {
    final response = await DioHelper.delete(
      "${AppStrings.baseurl}${AppStrings.endpointAddresses}/$addressId/delete",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success deleteAddress");
      }
      return true;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<Address> editAddress(addressId, lat, lng, address, nearestAddress,
      recipientName, phone) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurl}${AppStrings.endpointAddresses}/$addressId/update",
      body: {
        "lat": lat,
        "lng": lng,
        "address": address,
        "nearest_address": nearestAddress,
        "recipient_name": recipientName,
        "phone": phone,
      },
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success editAddress");
      }
      return Address.fromJson(response.data['body']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<Address> addAddress(
      lat, lng, address, nearestAddress, recipientName, phone) async {
    final response = await DioHelper.post(
      "${AppStrings.baseurl}${AppStrings.endpointAddresses}",
      body: {
        "lat": lat,
        "lng": lng,
        "address": address,
        "nearest_address": nearestAddress,
        "recipient_name": recipientName,
        "phone": phone,
      },
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success addAddress");
      }
      return Address.fromJson(response.data['body']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AddressesModel> getAddresses() async {
    final response = await DioHelper.get(
      "${AppStrings.baseurl}${AppStrings.endpointAddresses}",
    );
    if (response.data['success'] == true) {
      if (kDebugMode) {
        print("Success getAddresses");
      }
      return AddressesModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
