import 'product.dart';

class FavoritesModel {
  bool? success;
  String? message;
  int? notificationCount;
  List<Product>? body;

  FavoritesModel({this.success, this.message, this.notificationCount, this.body});

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    if (json['body'] != null) {
      body = <Product>[];
      json['body'].forEach((v) { body!.add(Product.fromJson(v)); });
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