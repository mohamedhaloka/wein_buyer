import 'category.dart';

class MainCategoriesModel {
  bool? success;
  String? message;
  int? notificationCount;
  List<Category>? body;

  MainCategoriesModel({this.success, this.message, this.notificationCount, this.body,});

  MainCategoriesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    if (json['body'] != null) {
      body = <Category>[];
      json['body'].forEach((v) { body!.add(Category.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['notification_count'] = notificationCount;
    if (body != null) {
      data['body'] = body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}