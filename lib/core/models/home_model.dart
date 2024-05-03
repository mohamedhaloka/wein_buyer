import 'package:wein_buyer/core/models/category.dart';
import 'package:wein_buyer/core/models/product.dart';

class HomeModel {
  bool? success;
  String? message;
  int? notificationCount;
  Home? body;

  HomeModel({this.success, this.message, this.notificationCount, this.body});

  HomeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    body = json['body'] != null ? Home.fromJson(json['body']) : null;
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

class Home {
  List<String>? slider;
  List<Category>? categories;
  List<Product>? offers;
  List<Product>? freeDelivery;

  Home({this.slider, this.categories, this.offers, this.freeDelivery});

  Home.fromJson(Map<String, dynamic> json) {
    slider = json['slider'].cast<String>();
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
    if (json['offers'] != null) {
      offers = <Product>[];
      json['offers'].forEach((v) {
        offers!.add(Product.fromJson(v));
      });
    }
    if (json['free_delivery'] != null) {
      freeDelivery = <Product>[];
      json['free_delivery'].forEach((v) {
        freeDelivery!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slider'] = slider;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    if (freeDelivery != null) {
      data['free_delivery'] =
          freeDelivery!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Properties {
  String? color;
  String? size;
  String? quantity;

  Properties({this.color, this.size, this.quantity});

  Properties.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    size = json['size'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color'] = color;
    data['size'] = size;
    data['quantity'] = quantity;
    return data;
  }
}