import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/cart_model.dart';
import 'package:wein_buyer/core/models/notification_model.dart';
import '../../../../../../../core/error/failure.dart';

abstract class BaseNotificationRepository {
  Future<Either<Failure, NotificationModel>> getNotification();
}
