class SizeGuidesModel {
  bool? success;
  String? message;
  int? notificationCount;
  List<SizeGuides>? sizeGuides;

  SizeGuidesModel({this.success, this.message, this.notificationCount, this.sizeGuides});

  SizeGuidesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    if (json['body'] != null) {
      sizeGuides = <SizeGuides>[];
      json['body'].forEach((v) { sizeGuides!.add(SizeGuides.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['notification_count'] = this.notificationCount;
    if (this.sizeGuides != null) {
      data['body'] = this.sizeGuides!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SizeGuides {
  int? id;
  String? name;
  String? image;

  SizeGuides({this.id, this.name, this.image});

  SizeGuides.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

