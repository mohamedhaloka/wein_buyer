class UserProviderModel {
  bool? success;
  String? message;
  int? notificationCount;
  User? user;

  UserProviderModel({this.success, this.message, this.notificationCount, this.user});

  UserProviderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    user = json['body'] != null ? User.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['notification_count'] = notificationCount;
    if (user != null) {
      data['body'] = user!.toJson();
    }
    return data;
  }
}

class User {
  UserData? user;
  String? token;

  User({this.user, this.token});

  User.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? storeName;
  String? description;
  String? slug;
  String? image;
  String? header;
  String? phone;
  bool? verified;
  bool? canEdit;
  String? location;
  String? address;
  bool? open;
  int? deliveryCost;
  int? balance;
  int? rate;
  String? lat;
  String? lng;
  Disnatnces? disnatnces;

  UserData({
    this.id,
    this.name,
    this.email,
    this.storeName,
    this.description,
    this.slug,
    this.image,
    this.header,
    this.phone,
    this.verified,
    this.canEdit,
    this.location,
    this.address,
    this.open,
    this.deliveryCost,
    this.balance,
    this.rate,
    this.lng,
    this.lat,
    this.disnatnces,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    storeName = json['store_name'];
    description = json['description'];
    slug = json['slug'];
    image = json['image'];
    header = json['header'];
    phone = json['phone'];
    verified = json['verified'];
    canEdit = json['can_edit'];
    location = json['location'];
    address = json['address'];
    open = json['open'];
    deliveryCost = json['delivery_cost'];
    balance = json['balance'];
    rate = json['rate'];
    lng = json['lng'];
    lat = json['lat'];
    disnatnces = json['disnatnces'] != null
        ? Disnatnces.fromJson(json['disnatnces'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['store_name'] = storeName;
    data['description'] = description;
    data['slug'] = slug;
    data['image'] = image;
    data['header'] = header;
    data['phone'] = phone;
    data['verified'] = verified;
    data['can_edit'] = canEdit;
    data['location'] = location;
    data['address'] = address;
    data['open'] = open;
    data['delivery_cost'] = deliveryCost;
    data['balance'] = balance;
    data['rate'] = rate;
    data['lng'] = lng;
    data['lat'] = lat;
    if (disnatnces != null) {
      data['disnatnces'] = disnatnces!.toJson();
    }
    return data;
  }
}

class Disnatnces {
  AroundMe? aroundMe;
  AroundMe? locale;
  AroundMe? domestic;

  Disnatnces({this.aroundMe, this.locale, this.domestic});

  Disnatnces.fromJson(Map<String, dynamic> json) {
    aroundMe = json['around_me'] != null
        ? AroundMe.fromJson(json['around_me'])
        : null;
    locale =
    json['locale'] != null ? AroundMe.fromJson(json['locale']) : null;
    domestic = json['domestic'] != null
        ? AroundMe.fromJson(json['domestic'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (aroundMe != null) {
      data['around_me'] = aroundMe!.toJson();
    }
    if (locale != null) {
      data['locale'] = locale!.toJson();
    }
    if (domestic != null) {
      data['domestic'] = domestic!.toJson();
    }
    return data;
  }
}

class AroundMe {
  int? min;
  int? max;
  int? price;

  AroundMe({this.min, this.max, this.price});

  AroundMe.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min'] = min;
    data['max'] = max;
    data['price'] = price;
    return data;
  }
}
