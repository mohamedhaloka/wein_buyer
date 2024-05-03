class MyRatesModel {
  bool? success;
  String? message;
  int? notificationCount;
  Body? body;

  MyRatesModel({
    this.success,
    this.message,
    this.notificationCount,
    this.body,
  });

  MyRatesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['notification_count'] = this.notificationCount;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}

class Body {
  num? total;
  List<Rates>? rates;

  Body({this.total, this.rates});

  Body.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['rates'] != null) {
      rates = <Rates>[];
      json['rates'].forEach((v) {
        rates!.add(new Rates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.rates != null) {
      data['rates'] = this.rates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rates {
  num? rate;
  int? numberOfRates;
  num? totalRates;

  Rates({this.rate, this.numberOfRates, this.totalRates});

  Rates.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    numberOfRates = json['number_of_rates'];
    totalRates = json['total_rates'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['number_of_rates'] = this.numberOfRates;
    data['total_rates'] = this.totalRates;
    return data;
  }
}
