import 'package:wein_buyer/core/models/product.dart';

class ProductsModel {
  bool? success;
  String? message;
  int? notificationCount;
  List<Product>? body;

  ProductsModel({this.success, this.message, this.notificationCount, this.body});

  ProductsModel.fromJson(Map<String, dynamic> json) {
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