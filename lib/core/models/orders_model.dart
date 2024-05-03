class OrdersModel {
  bool? success;
  String? message;
  int? notificationCount;
  List<Order>? body;

  OrdersModel({
    this.success,
    this.message,
    this.notificationCount,
    this.body,
  });

  OrdersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    if (json['body'] != null) {
      body = <Order>[];
      json['body'].forEach((v) {
        body!.add(Order.fromJson(v));
      });
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

class Order {
  int? id;
  List<Items>? items;
  num? price;
  ConversedPrice? conversedPrice;
  num? deliveryPrice;
  num? totalPrice;
  String? currencyCode;
  String? status;
  String? statusText;
  String? createdAt;
  Address? address;
  int? clientId;
  String? clientName;
  Merchant? merchant;
  String? paymentMethod;
  String? paymentMethodText;
  String? rejectReason;
  String? cancelReason;

  Order(
      {this.id,
      this.items,
      this.price,
      this.conversedPrice,
      this.deliveryPrice,
      this.totalPrice,
      this.currencyCode,
      this.status,
      this.statusText,
      this.createdAt,
      this.address,
      this.clientId,
      this.clientName,
      this.merchant,
      this.paymentMethod,
      this.paymentMethodText,
      this.rejectReason,
      this.cancelReason});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    price = json['price'];
    conversedPrice = json['conversed_price'] != null
        ? ConversedPrice.fromJson(json['conversed_price'])
        : null;
    deliveryPrice = json['delivery_price'];
    totalPrice = json['total_price'];
    currencyCode = json['currency_code'];
    status = json['status'];
    statusText = json['status_text'];
    createdAt = json['created_at'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    clientId = json['client_id'];
    clientName = json['client_name'];
    merchant =
        json['merchant'] != null ? Merchant.fromJson(json['merchant']) : null;
    paymentMethod = json['payment_method'];
    paymentMethodText = json['payment_method_text'];
    rejectReason = json['reject_reason'];
    cancelReason = json['cancel_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['price'] = price;
    if (conversedPrice != null) {
      data['conversed_price'] = conversedPrice!.toJson();
    }
    data['delivery_price'] = deliveryPrice;
    data['total_price'] = totalPrice;
    data['currency_code'] = currencyCode;
    data['status'] = status;
    data['status_text'] = statusText;
    data['created_at'] = createdAt;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['client_id'] = clientId;
    data['client_name'] = clientName;
    if (merchant != null) {
      data['merchant'] = merchant!.toJson();
    }
    data['payment_method'] = paymentMethod;
    data['payment_method_text'] = paymentMethodText;
    data['reject_reason'] = rejectReason;
    data['cancel_reason'] = cancelReason;
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

class Items {
  int? productId;
  String? name;
  List<String>? image;
  String? price; ///todo
  int? quantity;
  Details? details;

  Items(
      {this.productId,
      this.name,
      this.image,
      this.price,
      this.quantity,
      this.details});

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    image = json['image'].cast<String>();
    price = json['price'];
    quantity = json['quantity'];
    details =
        json['details'] != null ? Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['quantity'] = quantity;
    if (details != null) {
      data['details'] = details!.toJson();
    }
    return data;
  }
}

class Details {
  String? color;
  String? size;

  Details({this.color, this.size});

  Details.fromJson(Map<String, dynamic> json) {
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

class Address {
  int? id;
  String? address;
  String? nearestAddress;
  String? phone;
  bool? isDefault;
  String? recipientName;
  String? lat;
  String? lng;

  Address(
      {this.id,
      this.address,
      this.nearestAddress,
      this.phone,
      this.isDefault,
      this.recipientName,
      this.lat,
      this.lng});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    nearestAddress = json['nearest_address'];
    phone = json['phone'];
    isDefault = json['is_default'];
    recipientName = json['recipient_name'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address'] = address;
    data['nearest_address'] = nearestAddress;
    data['phone'] = phone;
    data['is_default'] = isDefault;
    data['recipient_name'] = recipientName;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class Merchant {
  int? id;
  String? name;
  String? logo;
  int? rate;

  Merchant({this.id, this.name, this.logo, this.rate});

  Merchant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    data['rate'] = rate;
    return data;
  }
}
