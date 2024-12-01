class CurrenciesModel {
  bool? success;
  String? message;
  int? notificationCount;
  List<Currency>? body;

  CurrenciesModel(
      {this.success, this.message, this.notificationCount, this.body});

  CurrenciesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    if (json['body'] != null) {
      body = <Currency>[];
      json['body'].forEach((v) {
        body!.add(Currency.fromJson(v));
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

class Currency {
  int? id;
  String? name;
  String? code;
  num? exchangeRate;
  String? createdAt;
  String? updatedAt;
  bool? isSelected;

  Currency(
      {this.id,
      this.name,
      this.code,
      this.exchangeRate,
      this.createdAt,
      this.updatedAt});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    exchangeRate = json['exchange_rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['exchange_rate'] = exchangeRate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  @override
  bool operator ==(Object other) {
    return other is Currency && id == other.id;
  }

  @override
  int get hashCode => this.id.hashCode;
}
