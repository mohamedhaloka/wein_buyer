import 'package:firebase_messaging/firebase_messaging.dart';

class RegisterModel {
  final String nameStore;
  final String descStore;
  final String name;
  final String phone;
  final String email;
  final String address;
  final String location;
  final String password;
  final num aroundMeMin;
  final num aroundMeMax;
  final num aroundMePrice;
  final num localeMin;
  final num localeMax;
  final num localePrice;
  final num domesticMin;
  final num domesticMax;
  final num domesticPrice;

  RegisterModel({
    required this.nameStore,
    required this.descStore,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.location,
    required this.password,
    required this.aroundMeMin,
    required this.aroundMeMax,
    required this.aroundMePrice,
    required this.localeMin,
    required this.localeMax,
    required this.localePrice,
    required this.domesticMin,
    required this.domesticMax,
    required this.domesticPrice,
  });

  Future<Map<String, dynamic>> toJson() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    final String? token = await firebaseMessaging.getToken();
    return {
      'store_name': nameStore,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'description': descStore,
      'address': address,
      'location': location,
      'currency_id': 2,
      "fcm_token": token,
      "distances": {
        "around_me": {
          "min": aroundMeMin,
          "max": aroundMeMax,
          "price": aroundMePrice,
        },
        "locale": {
          "min": localeMin,
          "max": localeMax,
          "price": localePrice,
        },
        "domestic": {
          "min": domesticMin,
          "max": domesticMax,
          "price": domesticPrice,
        },
      },
    };
  }
}
