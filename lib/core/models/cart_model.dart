import 'package:wein_buyer/core/models/product.dart';

class CartModel {
  bool? success;
  String? message;
  int? notificationCount;
  Cart? body;

  CartModel({this.success, this.message, this.notificationCount, this.body});

  CartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    body = json['body'] != null ? Cart.fromJson(json['body']) : null;
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

class Cart {
  List<Items>? items;
  num? price;
  num? delivery;
  num? total;
  String? currency;

  Cart({this.items, this.price, this.delivery, this.total});

  Cart.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    price = json['price'];
    delivery = json['delivery'];
    total = json['total'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['price'] = price;
    data['delivery'] = delivery;
    data['total'] = total;
    data['currency'] = currency;
    return data;
  }
}

class Items {
  String? itemId;
  Product? product;
  int? quantity;
  num? price;
  Properties? properties;

  Items(
      {this.itemId, this.product, this.quantity, this.price, this.properties});

  Items.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
    price = json['price'];
    properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['quantity'] = quantity;
    data['price'] = price;
    if (properties != null) {
      data['properties'] = properties!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;

  Category({this.id, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
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

class PropertiesMap {
  List<String>? color;
  List<String>? size;
  List<String>? quantity;

  PropertiesMap({this.color, this.size, this.quantity});

  PropertiesMap.fromJson(Map<String, dynamic> json) {
    color = json['color'].cast<String>();
    size = json['size'].cast<String>();
    quantity = json['quantity'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color'] = color;
    data['size'] = size;
    data['quantity'] = quantity;
    return data;
  }
}

class PropertiesItem {
  String? color;
  String? size;

  PropertiesItem({this.color, this.size});

  PropertiesItem.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color'] = color;
    data['size'] = size;
    return data;
  }
}

class Files {
  String? type;
  String? file;

  Files({this.type, this.file});

  Files.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['file'] = file;
    return data;
  }
}
