class NotificationModel {
  bool? success;
  String? message;
  int? notificationCount;
  List<Notification>? body;

  NotificationModel({this.success, this.message, this.notificationCount, this.body});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    if (json['body'] != null) {
      body = <Notification>[];
      json['body'].forEach((v) { body!.add(Notification.fromJson(v)); });
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

class Notification{
  String? id;
  String? text;
  String? type;
  bool? readed;
  int? objectId;
  String? createdAt;

  Notification(this.id, this.text, this.type, this.readed, this.objectId,
      this.createdAt);

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    type = json['type'];
    readed = json['readed'];
    objectId = json['object_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['type'] = type;
    data['readed'] = readed;
    data['object_id'] = objectId;
    data['created_at'] = createdAt;
    return data;
  }
}