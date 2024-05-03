class UserUserModel {
  bool? success;
  String? message;
  int? notificationCount;
  User? user;

  UserUserModel({this.success, this.message, this.notificationCount, this.user});

  UserUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    user = json['body'] != null ? User.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['notification_count'] = notificationCount;
    if (user != null) {
      data['body'] = user!.toJson();
    }
    return data;
  }
}

class User {
  UserData? user;
  String? token;

  User({this.user, this.token});

  User.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class UserData {
  int? id;
  String? firstName;
  String? lastName;
  String? image;
  String? gender;
  String? birthYear;
  bool? verified;

  UserData({this.id, this.firstName, this.lastName, this.image, this.gender, this.birthYear, this.verified});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    gender = json['gender'];
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
    data['birth_year'] = birthYear;
    data['verified'] = verified;
    return data;
  }
}
