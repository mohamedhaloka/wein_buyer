import 'package:wein_buyer/core/models/product.dart';

import 'category.dart';

class SubCategoriesModel {
  bool? success;
  String? message;
  int? notificationCount;
  Body? body;

  SubCategoriesModel({this.success, this.message, this.notificationCount, this.body});

  SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
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
  List<Category>? subCategories;
  List<Product>? topRatedProducts;

  Body({this.subCategories, this.topRatedProducts});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['sub_categories'] != null) {
      subCategories = <Category>[];
      json['sub_categories'].forEach((v) { subCategories!.add(Category.fromJson(v)); });
    }
    if (json['top_rated_products'] != null) {
      topRatedProducts = <Product>[];
      json['top_rated_products'].forEach((v) { topRatedProducts!.add(Product.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (subCategories != null) {
      data['sub_categories'] = subCategories!.map((v) => v.toJson()).toList();
    }
    if (topRatedProducts != null) {
      data['top_rated_products'] = topRatedProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
