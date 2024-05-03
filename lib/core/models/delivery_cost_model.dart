class DeliveryCostModel {
  AroundMe? aroundMe;
  AroundMe? locale;
  AroundMe? domestic;

  DeliveryCostModel({this.aroundMe, this.locale, this.domestic});

  DeliveryCostModel.fromJson(Map<String, dynamic> json) {
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
