class MarketDetailsModel {
  bool? success;
  String? message;
  int? notificationCount;
  MarketDetails? body;

  MarketDetailsModel({this.success, this.message, this.notificationCount, this.body});

  MarketDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    body = json['body'] != null ? MarketDetails.fromJson(json['body']) : null;
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

class MarketDetails {
  int? id;
  String? storeName;
  String? description;
  String? slug;
  String? image;
  String? header;
  String? location;
  String? lat;
  String? lng;
  num? radius;
  dynamic distance;
  String? address;
  bool? open;
  num? deliveryCost;
  RateMap? rateMap;

  MarketDetails({this.id, this.storeName, this.description, this.slug, this.image, this.header, this.location, this.lat, this.lng, this.radius, this.distance, this.address, this.open, this.deliveryCost, this.rateMap});

  MarketDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeName = json['store_name'];
    description = json['description'];
    slug = json['slug'];
    image = json['image'];
    header = json['header'];
    location = json['location'];
    lat = json['lat'];
    lng = json['lng'];
    radius = json['radius'];
    distance = json['distance'];
    address = json['address'];
    open = json['open'];
    deliveryCost = json['delivery_cost'];
    rateMap = json['rate_map'] != null ? RateMap.fromJson(json['rate_map']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['store_name'] = storeName;
    data['description'] = description;
    data['slug'] = slug;
    data['image'] = image;
    data['header'] = header;
    data['location'] = location;
    data['lat'] = lat;
    data['lng'] = lng;
    data['radius'] = radius;
    data['distance'] = distance;
    data['address'] = address;
    data['open'] = open;
    data['delivery_cost'] = deliveryCost;
    if (rateMap != null) {
      data['rate_map'] = rateMap!.toJson();
    }
    return data;
  }
}

class RateMap {
  num? rate;
  List<Rates>? rates;
  int? count;

  RateMap({this.rate, this.rates, this.count});

  RateMap.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    if (json['rates'] != null) {
      rates = <Rates>[];
      json['rates'].forEach((v) { rates!.add(Rates.fromJson(v)); });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    if (rates != null) {
      data['rates'] = rates!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class Rates {
  int? key;
  int? value;

  Rates({this.key, this.value});

  Rates.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}
