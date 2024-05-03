class AddressesModel {
  bool? success;
  String? message;
  int? notificationCount;
  List<Address>? address;

  AddressesModel(
      {this.success, this.message, this.notificationCount, this.address});

  AddressesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    if (json['body'] != null) {
      address = <Address>[];
      json['body'].forEach((v) {
        address!.add(Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['notification_count'] = notificationCount;
    if (address != null) {
      data['body'] = address!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  int? id;
  String? address;
  String? nearestAddress;
  String? recipientName;
  String? lat;
  String? lng;
  String? phone;
  bool? isDefault;

  Address({
    this.id,
    this.address,
    this.nearestAddress,
    this.recipientName,
    this.lat,
    this.lng,
    this.phone,
    this.isDefault,
  });

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    nearestAddress = json['nearest_address'];
    recipientName = json['recipient_name'];
    lat = json['lat'];
    lng = json['lng'];
    phone = json['phone'];
    isDefault = json['is_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address'] = address;
    data['nearest_address'] = nearestAddress;
    data['recipient_name'] = recipientName;
    data['lat'] = lat;
    data['lng'] = lng;
    data['phone'] = phone;
    data['is_default'] = isDefault;
    return data;
  }
}
