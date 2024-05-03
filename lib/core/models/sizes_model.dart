class SizesModel {
  bool? success;
  String? message;
  int? notificationCount;
  List<Sizes>? body;

  SizesModel({this.success, this.message, this.notificationCount, this.body});

  SizesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    if (json['body'] != null) {
      body = <Sizes>[];
      json['body'].forEach((v) { body!.add(Sizes.fromJson(v)); });
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

class Sizes {
  String? key;
  String? value;

  Sizes({this.key, this.value});

  Sizes.fromJson(Map<String, dynamic> json) {
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