class ProfileModel {
  bool? success;
  String? message;
  int? notificationCount;
  Body? body;

  ProfileModel({this.success, this.message, this.notificationCount, this.body});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['notification_count'] = notificationCount;
    if (body != null) {
      data['body'] = body!.toJson();
    }
    return data;
  }
}

class Body {
  int? id;
  String? firstName;
  String? lastName;
  String? image;
  String? gender;
  String? email;
  String? phone;
  String? birthYear;
  bool? verified;

  Body({this.id, this.firstName, this.lastName, this.image, this.gender, this.email , this.phone ,this.birthYear, this.verified});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    birthYear = json['birth_year'];
    verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['image'] = image;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['birth_year'] = birthYear;
    data['verified'] = verified;
    return data;
  }
}