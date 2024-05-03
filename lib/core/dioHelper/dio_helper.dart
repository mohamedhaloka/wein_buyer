import 'dart:developer';

import 'package:dio/dio.dart';
import '../appStorage/app_storage.dart';
import '../utils/app_strings.dart';

class DioHelper {
  static Dio dioSingleton = Dio()..options;
  // ..interceptors.add(InterceptorsWrapper(
  // onRequest: (options , handler) => log(options.toString()),
  // onResponse: (response , handler) => log(response.toString()),
  // onError: (dioError , handler) => log(dioError.toString())))

  static Future<Response<dynamic>> post(
    String path, {
    FormData? formData,
    Map<String, dynamic>? body,
    Map<String, dynamic> headers = const {},
  }) {
    dioSingleton.options.headers.addAll({
      if (AppStorage.getUseProviderrData != null)
        "authorization":
            "Bearer ${AppStorage.getUserProviderInfo!.user!.token}",
      if (AppStorage.getUserData != null)
        "authorization": "Bearer ${AppStorage.getUserInfo!.user!.token}",
      "Accept-Language": AppStorage.getLang,
      if (AppStorage.getSelectedUserCurrency != null)
        'currency': AppStorage.getSelectedUserCurrency!.code,
    });
    dioSingleton.options.headers.addAll(headers);
    return dioSingleton.post(path,
        data: formData != null ? body : FormData.fromMap(body ?? {}),
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));
  }

  static Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic> headers = const {},
  }) {
    dioSingleton.options.headers.addAll({
      if (AppStorage.getUserProviderInfo != null)
        "authorization":
            "Bearer ${AppStorage.getUserProviderInfo!.user!.token}",
      if (AppStorage.getUserInfo != null)
        "authorization": "Bearer ${AppStorage.getUserInfo!.user!.token}",
      "Accept-Language": AppStorage.getLang,
      if (AppStorage.getSelectedUserCurrency != null)
        'currency': AppStorage.getSelectedUserCurrency!.code,
    });
    dioSingleton.options.headers.addAll(headers);
    return dioSingleton.get(path);
  }

  static Future<Response<dynamic>> delete(
    String path, {
    FormData? formData,
    Map<String, dynamic>? body,
    Map<String, dynamic> headers = const {},
  }) {
    dioSingleton.options.headers.addAll({
      if (AppStorage.getUseProviderrData != null)
        "authorization":
            "Bearer ${AppStorage.getUserProviderInfo!.user!.token}",
      if (AppStorage.getUserData != null)
        "authorization": "Bearer ${AppStorage.getUserInfo!.user!.token}",
      "Accept-Language": AppStorage.getLang,
    });
    dioSingleton.options.headers.addAll(headers);
    return dioSingleton.delete(path,
        data: formData == null ? body : FormData.fromMap(body ?? {}),
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));
  }
}
