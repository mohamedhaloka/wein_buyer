class SubCategoriesModel {
  bool? success;
  String? message;
  int? notificationCount;
  List<SubCategoryData>? categoryData;

  SubCategoriesModel copyWith({
    bool? success,
    String? message,
    int? notificationCount,
    List<SubCategoryData>? categoryData,
  }) {
    return SubCategoriesModel(
      success: success ?? this.success,
      message: message ?? this.message,
      notificationCount: notificationCount ?? this.notificationCount,
      categoryData: categoryData ?? this.categoryData,
    );
  }

  SubCategoriesModel({
    this.success,
    this.message,
    this.notificationCount,
    this.categoryData,
  });

  SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    if (json['body'] != null) {
      categoryData = <SubCategoryData>[];
      json['body'].forEach((v) {
        categoryData!.add(SubCategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['notification_count'] = notificationCount;
    if (categoryData != null) {
      data['body'] = categoryData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategoryData {
  int? id;
  String? name;
  bool? byMe;
  bool? active;
  bool? isSelected;

  SubCategoryData({this.id, this.name, this.byMe, this.active , this.isSelected});

  SubCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    byMe = json['byMe'];
    active = json['active'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['byMe'] = byMe;
    data['active'] = active;
    return data;
  }
}
