import 'package:wein_buyer/core/models/product.dart';

class ProductDetails {
  Product? product;
  List<SizeGuide>? sizeGuide;
  ShippingDetails? shippingDetails;
  String? returnPolicy;
  List<Rates>? rates;
  Merchant? merchant;

  ProductDetails(
      {this.product,
      this.sizeGuide,
      this.shippingDetails,
      this.returnPolicy,
      this.rates,
      this.merchant});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    if (json['size_guide'] != null) {
      sizeGuide = <SizeGuide>[];
      json['size_guide'].forEach((v) {
        sizeGuide!.add(SizeGuide.fromJson(v));
      });
    }
    shippingDetails = json['shipping_details'] != null
        ? ShippingDetails.fromJson(json['shipping_details'])
        : null;
    returnPolicy = json['return_policy'];
    if (json['rates'] != null) {
      rates = <Rates>[];
      json['rates'].forEach((v) {
        rates!.add(Rates.fromJson(v));
      });
    }
    merchant =
        json['merchant'] != null ? Merchant.fromJson(json['merchant']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (sizeGuide != null) {
      data['size_guide'] = sizeGuide!.map((v) => v.toJson()).toList();
    }
    if (shippingDetails != null) {
      data['shipping_details'] = shippingDetails!.toJson();
    }
    data['return_policy'] = returnPolicy;
    if (rates != null) {
      data['rates'] = rates!.map((v) => v.toJson()).toList();
    }
    if (merchant != null) {
      data['merchant'] = merchant!.toJson();
    }
    return data;
  }
}

class SizeGuide {
  int? id;
  String? name;
  String? image;

  SizeGuide({this.id, this.name, this.image});

  SizeGuide.fromJson(Map<String, dynamic> json) {
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

class ShippingDetails {
  num? deliveryRadius;
  bool? canDeliverToUserLocation;
  num? deliveryCost;

  ShippingDetails(
      {this.deliveryRadius, this.canDeliverToUserLocation, this.deliveryCost});

  ShippingDetails.fromJson(Map<String, dynamic> json) {
    deliveryRadius = json['delivery_radius'];
    canDeliverToUserLocation = json['can_deliver_to_user_location'];
    deliveryCost = json['delivery_cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['delivery_radius'] = deliveryRadius;
    data['can_deliver_to_user_location'] = canDeliverToUserLocation;
    data['delivery_cost'] = deliveryCost;
    return data;
  }
}

class Merchant {
  int? id;
  String? name;
  String? image;
  num? rate;
  int? rateCount;

  Merchant({this.id, this.name, this.image, this.rate, this.rateCount});

  Merchant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    rate = json['rate'];
    rateCount = json['rate_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['rate'] = rate;
    data['rate_count'] = rateCount;
    return data;
  }
}

class Rates {
  int? id;
  String? name;
  num? rate;
  String? comment;
  String? createdAt;

  Rates({this.id, this.name, this.rate, this.comment, this.createdAt});

  Rates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rate = json['rate'];
    comment = json['comment'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['rate'] = rate;
    data['comment'] = comment;
    data['created_at'] = createdAt;
    return data;
  }
}
