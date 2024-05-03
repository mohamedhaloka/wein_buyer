class Product {
  int? id;
  Categories? category;
  String? name;
  String? description;
  num? rate;
  List<String>? images;
  List<Files>? files;
  num? price;
  String? currency;
  ConversedPrice? conversedPrice;
  OldPrice? oldPrice;
  num? discount;
  num? priceAfterDiscount;
  List<Properties>? properties;
  PropertiesMap? propertiesMap;
  String? distance;
  bool? inFavorite;

  Product({
    this.id,
    this.category,
    this.name,
    this.description,
    this.rate,
    this.images,
    this.files,
    this.price,
    this.currency,
    this.conversedPrice,
    this.oldPrice,
    this.discount,
    this.priceAfterDiscount,
    this.properties,
    this.propertiesMap,
    this.inFavorite,
    this.distance,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category =
        json['category'] != null ? Categories.fromJson(json['category']) : null;
    name = json['name'];
    description = json['description'];
    rate = json['rate'];
    images = json['images'].cast<String>();
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(Files.fromJson(v));
      });
    }
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
    propertiesMap = json['properties_map'] != null
        ? PropertiesMap.fromJson(json['properties_map'])
        : null;
    inFavorite = json['in_favorite'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['name'] = name;
    data['description'] = description;
    data['rate'] = rate;
    data['images'] = images;
    if (files != null) {
      data['files'] = files!.map((v) => v.toJson()).toList();
    }
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
    if (propertiesMap != null) {
      data['properties_map'] = propertiesMap!.toJson();
    }
    data['in_favorite'] = inFavorite;
    data['distance'] = distance;
    return data;
  }
}

class PropertiesMap {
  List<String>? color;
  List<String>? size;
  List<dynamic>? quantity;

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

class Properties {
  String? color;
  String? size;
  dynamic quantity; ///todo

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

class Categories {
  int? id;
  String? name;
  String? image;
  bool? byMe;
  bool? active;

  Categories({this.id, this.name, this.image, this.byMe, this.active});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    byMe = json['byMe'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['byMe'] = byMe;
    data['active'] = active;
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
