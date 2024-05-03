import 'currencies_model.dart';

class ProfileModel {
  bool? success;
  String? message;
  int? notificationCount;
  Profile? body;

  ProfileModel({this.success, this.message, this.notificationCount, this.body});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    body = json['body'] != null ? Profile.fromJson(json['body']) : null;
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

class Profile {
  User? user;
  Orders? orders;

  Profile({this.user, this.orders});

  Profile.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    orders = json['orders'] != null ? Orders.fromJson(json['orders']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (orders != null) {
      data['orders'] = orders!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? storeName;
  String? description;
  String? slug;
  String? image;
  String? header;
  bool? verified;
  bool? canEdit;
  String? location;
  String? lat;
  String? lng;
  num? radius;
  String? address;
  bool? open;
  num? deliveryCost;
  num? balance;
  num? rate;
  Currency? currency;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.storeName,
    this.description,
    this.slug,
    this.image,
    this.header,
    this.verified,
    this.canEdit,
    this.location,
    this.lat,
    this.lng,
    this.radius,
    this.address,
    this.open,
    this.deliveryCost,
    this.balance,
    this.rate,
    this.currency,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    storeName = json['store_name'];
    description = json['description'];
    slug = json['slug'];
    image = json['image'];
    header = json['header'];
    verified = json['verified'];
    canEdit = json['can_edit'];
    location = json['location'];
    lat = json['lat'];
    lng = json['lng'];
    radius = json['radius'];
    address = json['address'];
    open = json['open'];
    deliveryCost = json['delivery_cost'];
    balance = json['balance'];
    rate = json['rate'];
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['store_name'] = storeName;
    data['description'] = description;
    data['slug'] = slug;
    data['image'] = image;
    data['header'] = header;
    data['verified'] = verified;
    data['can_edit'] = canEdit;
    data['location'] = location;
    data['lat'] = lat;
    data['lng'] = lng;
    data['radius'] = radius;
    data['address'] = address;
    data['open'] = open;
    data['delivery_cost'] = deliveryCost;
    data['balance'] = balance;
    data['rate'] = rate;
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    return data;
  }
}

class Orders {
  int? totalOrders;
  num? cashOrdersCost;
  num? onlineOrdersCost;

  Orders({this.totalOrders, this.cashOrdersCost, this.onlineOrdersCost});

  Orders.fromJson(Map<String, dynamic> json) {
    totalOrders = json['total_orders'];
    cashOrdersCost = json['cash_orders_cost'];
    onlineOrdersCost = json['online_orders_cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_orders'] = totalOrders;
    data['cash_orders_cost'] = cashOrdersCost;
    data['online_orders_cost'] = onlineOrdersCost;
    return data;
  }
}
