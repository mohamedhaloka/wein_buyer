import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/cart_model.dart';
import 'package:wein_buyer/core/models/notification_model.dart';
import 'package:wein_buyer/view/notification/domain/repository/base_notification_repository.dart';
import 'package:wein_buyer/view/user/cart/domain/repository/base_cart_repository.dart';

import '../../../../../../../core/error/failure.dart';

class GetNotification {
  final BaseNotificationRepository baseNotificationRepository;

  GetNotification(this.baseNotificationRepository);

  Future<Either<Failure, NotificationModel>> execute() async {
    return await baseNotificationRepository.getNotification();
  }
}
