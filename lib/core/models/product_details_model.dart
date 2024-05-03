import 'product_details.dart';

class ProductDetailsModel {
  bool? success;
  String? message;
  int? notificationCount;
  ProductDetails? body;

  ProductDetailsModel(
      {this.success, this.message, this.notificationCount, this.body});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    notificationCount = json['notification_count'];
    body = json['body'] != null ? ProductDetails.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['notification_count'] = notificationCount;
    if (body != null) {
      data['body'] = body!.toJson();
    }
    return data;
  }
}
