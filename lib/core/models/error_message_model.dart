class ErrorMessageModel {
  bool? success;
  String? message;
  int? errorCode;
  List<String>? errors;
  int? notificationCount;

  ErrorMessageModel(
      {this.success,
        this.message,
        this.errorCode,
        this.errors,
        this.notificationCount});

  ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    errorCode = json['error_code'];
    errors = json['errors'].cast<String>();
    notificationCount = json['notification_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['error_code'] = errorCode;
    data['errors'] = errors;
    data['notification_count'] = notificationCount;
    return data;
  }
}
