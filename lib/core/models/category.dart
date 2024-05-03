
class Category {
  int? id;
  String? name;
  String? image;
  bool? byMe;
  bool? active;
  bool? isSelected;

  Category({this.id, this.name, this.image, this.byMe, this.active});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    byMe = json['byMe'];
    active = json['active'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['byMe'] = byMe;
    data['active'] = active;
    return data;
  }
}