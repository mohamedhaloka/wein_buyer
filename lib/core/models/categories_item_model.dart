class CategoriesItemModel {
  bool? success;
  String? message;
  int? notificationCount;
  List<CategoriesItem>? body;

  CategoriesItemModel({this.success, this.message, this.notificationCount, this.body});

  CategoriesItemModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    if (json['body'] != null) {
      body = <CategoriesItem>[];
      json['body'].forEach((v) { body!.add(CategoriesItem.fromJson(v)); });
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

class CategoriesItem {
  int? id;
  String? name;
  String? image;

  CategoriesItem({this.id, this.name, this.image});

  CategoriesItem.fromJson(Map<String, dynamic> json) {
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