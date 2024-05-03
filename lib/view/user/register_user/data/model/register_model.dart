import 'package:firebase_messaging/firebase_messaging.dart';

class RegisterModel {
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? password;

  RegisterModel({
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.password,
  });

  Future<Map<String, dynamic>> toJson() async{
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    final String? token = await firebaseMessaging.getToken();
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'password': password,
      "fcm_token": token,
      "email": email
    };
  }
}
