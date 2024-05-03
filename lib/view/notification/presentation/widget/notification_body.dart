import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/notification/presentation/controller/notification_cubit.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import 'package:intl/intl.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is GetNotificationsLoaded) {
          if (NotificationCubit.of(context).listOfNotification.isNotEmpty) {
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.getProportionateScreenHeight(10),
                horizontal: AppSizes.getProportionateScreenWidth(25),
              ),
              child: ListView.separated(
                itemCount:
                    NotificationCubit.of(context).listOfNotification.length,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          NotificationCubit.of(context)
                                  .listOfNotification[index]
                                  .text ??
                              '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.fontColor,
                          ),
                        ),
                      ),
                      SpaceH(inputHeigth: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          DateFormat('MM/dd/yyyy hh:mm a').format(
                              DateTime.parse(NotificationCubit.of(context)
                                      .listOfNotification[index]
                                      .createdAt ??
                                  '')),
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(217, 201, 191, 1),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Text(AppStrings.noNotification.translate()),
            );
          }
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
