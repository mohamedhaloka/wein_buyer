import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/notification/presentation/controller/notification_cubit.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';

import '../../../../../../../core/services/services_locator.dart';
import '../widget/notification_body.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(sl())..getNotification(),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.notificationTitle.translate(),
        ),
        body: const NotificationBody(),
      ),
    );
  }
}
