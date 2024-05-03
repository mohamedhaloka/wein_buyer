import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/models/notification_model.dart';
import 'package:wein_buyer/view/notification/domain/usecases/get_notification.dart';

import '../../../../../../../widgets/snackBar.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.getNotificationUseCase) : super(NotificationInitial());

  static NotificationCubit of(context) => BlocProvider.of(context);

  final GetNotification getNotificationUseCase;

  List<Notification> listOfNotification = [];

  Future getNotification() async {
    emit(GetNotificationsLoading());
    final res = await getNotificationUseCase.execute();
    res.fold(
          (err) {
        showSnackBar(err.message);
        emit(GetNotificationsError());
      },
          (res) async {
        listOfNotification.addAll(res.body ?? []);
        emit(GetNotificationsLoaded());
      },
    );
  }
}
