import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/notification_model.dart';
import '../../domain/repository/base_notification_repository.dart';
import '../datasource/notification_remote_datasource.dart';

class NotificationRepository extends BaseNotificationRepository {
  final BaseNotificationRemoteDatasource baseNotificationRemoteDatasource;

  NotificationRepository(this.baseNotificationRemoteDatasource);

  @override
  Future<Either<Failure, NotificationModel>> getNotification() async{
    try {
      final res = await baseNotificationRemoteDatasource.getNotification();
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }
}
