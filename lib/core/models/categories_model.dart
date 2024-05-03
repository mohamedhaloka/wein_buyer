class CategoriesModel {
  bool? success;
  String? message;
  int? notificationCount;
  List<CategoryData>? categoryData;

  CategoriesModel copyWith({
    bool? success,
    String? message,
    int? notificationCount,
    List<CategoryData>? categoryData,
  }) {
    return CategoriesModel(
      success: success ?? this.success,
      message: message ?? this.message,
      notificationCount: notificationCount ?? this.notificationCount,
      categoryData: categoryData ?? this.categoryData,
    );
  }

  CategoriesModel({
    this.success,
    this.message,
    this.notificationCount,
    this.categoryData,
  });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    if (json['body'] != null) {
      categoryData = <CategoryData>[];
      json['body'].forEach((v) {
        categoryData!.add(CategoryData.fromJson(v));
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

class CategoryData {
  int? id;
  String? name;
  bool? byMe;
  bool? active;
  bool? isSelected;

  CategoryData({this.id, this.name, this.byMe, this.active , this.isSelected});

  CategoryData.fromJson(Map<String, dynamic> json) {
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
