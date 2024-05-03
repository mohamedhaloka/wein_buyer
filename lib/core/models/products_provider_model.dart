import 'package:wein_buyer/core/models/categories_model.dart';

class ProductsModel {
  bool? success;
  String? message;
  int? notificationCount;
  List<ProductData>? productData;

  ProductsModel copyWith({
    bool? success,
    String? message,
    int? notificationCount,
    List<ProductData>? productData,
  }) {
    return ProductsModel(
      success: success ?? this.success,
      message: message ?? this.message,
      notificationCount: notificationCount ?? this.notificationCount,
      productData: productData ?? this.productData,
    );
  }

  ProductsModel({
    this.success,
    this.message,
    this.notificationCount,
    this.productData,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    if (json['body'] != null) {
      productData = <ProductData>[];
      json['body'].forEach((v) {
        productData!.add(ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['notification_count'] = notificationCount;
    if (productData != null) {
      data['body'] = productData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductData {
  int? id;
  CategoryData? category;
  CategoryData? parentCategory;
  String? name;
  String? description;
  List<String>? images;
  num? price;
  String? currency;
  ConversedPrice? conversedPrice;
  OldPrice? oldPrice;
  num? discount;
  num? priceAfterDiscount;
  List<Properties>? properties;
  List<Files>? files;
  num? rate;
  String? distance;

  ProductData({
    this.id,
    this.category,
    this.parentCategory,
    this.name,
    this.description,
    this.images,
    this.price,
    this.currency,
    this.conversedPrice,
    this.oldPrice,
    this.discount,
    this.priceAfterDiscount,
    this.properties,
    this.files,
    this.rate,
    this.distance,
  });

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? CategoryData.fromJson(json['category'])
        : null;
    parentCategory = json['parent_category'] != null
        ? CategoryData.fromJson(json['parent_category'])
        : null;
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    price = json['price'];
    currency = json['currency'];
    conversedPrice = json['conversed_price'] != null
        ? ConversedPrice.fromJson(json['conversed_price'])
        : null;
    oldPrice =
        json['old_price'] != null ? OldPrice.fromJson(json['old_price']) : null;
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount'];
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(Properties.fromJson(v));
      });
    }
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(Files.fromJson(v));
      });
    }
    rate = json['rate'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (parentCategory != null) {
      data['parent_category'] = parentCategory!.toJson();
    }
    data['name'] = name;
    data['description'] = description;
    data['images'] = images;
    data['price'] = price;
    data['currency'] = currency;
    if (conversedPrice != null) {
      data['conversed_price'] = conversedPrice!.toJson();
    }
    if (oldPrice != null) {
      data['old_price'] = oldPrice!.toJson();
    }
    data['discount'] = discount;
    data['price_after_discount'] = priceAfterDiscount;
    if (properties != null) {
      data['properties'] = properties!.map((v) => v.toJson()).toList();
    }
    if (files != null) {
      data['files'] = files!.map((v) => v.toJson()).toList();
    }
    data['rate'] = rate;
    data['distance'] = distance;
    return data;
  }
}

class ConversedPrice {
  num? price;
  String? currency;

  ConversedPrice({this.price, this.currency});

  ConversedPrice.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['currency'] = currency;
    return data;
  }
}

class OldPrice {
  num? price;
  String? currency;

  OldPrice({this.price, this.currency});

  OldPrice.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['currency'] = currency;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  bool? byMe;
  bool? active;

  Category({this.id, this.name, this.byMe, this.active});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    byMe = json['byMe'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['byMe'] = byMe;
    data['active'] = active;
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
