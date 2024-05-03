import 'dart:io';

import 'package:dio/dio.dart';

class EditProfileDataModel {
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? birthYear;
  String? gender;
  File? image;

  EditProfileDataModel(this.firstName, this.lastName, this.phone, this.email,
      this.birthYear, this.gender, this.image);

  Future<Map<String, dynamic>> toJson() async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['birth_year'] = birthYear;
    data['gender'] = gender;
    data['image'] = image == null
        ? null
        : await MultipartFile.fromFile(image!.path,
            filename: image!.path.split('/').last);
    return data;
  }
}
