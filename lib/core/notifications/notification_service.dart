import "dart:developer";

import "package:firebase_core/firebase_core.dart";
import "package:firebase_messaging/firebase_messaging.dart";
import 'package:flutter/material.dart';
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/view/notification/presentation/screen/notification_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> backgroundHandler(RemoteMessage message) async {
  // if (int.parse(message.data["type"]) == -1) {
  //   navigatorKey.currentState!.context.read<AuthCubit>().onUpdateAuth(false);
  //   navigatorKey.currentState!.context
  //       .read<UserCubit>()
  //       .onUpdateUserData(UserModel());
  //   Utils.clearSavedData();
  //   GlobalState.instance.set("token", "");
  //   navigatorKey.currentState!.pushNamed(Routes.loginRoute);
  // } else if (int.parse(message.data["type"]) == 10) {
  //   UserModel user =
  //       navigatorKey.currentState!.context.read<UserCubit>().state.model;
  //   user.isApproved = true;
  //   navigatorKey.currentState!.context.read<UserCubit>().onUpdateUserData(user);
  // }
  // navigatorKey.currentState!.context
  //     .read<NotificationCountCubit>()
  //     .onUpdateCountData(true);
  await Firebase.initializeApp();
}

void requestPermissions() {
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
    alert: true,
    badge: true,
    sound: true,
  );
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.requestPermission();
}

void showNotification(RemoteMessage event, String payload) async {
  var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
      presentAlert: true, presentBadge: true, presentSound: true);
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      "com.user.hMart", "EZYGO",
      channelDescription: "notificationBase",
      enableVibration: true,
      playSound: true,
      icon: "app_icon",
      importance: Importance.high,
      priority: Priority.high);
  var notificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  String title = "${event.notification!.title}";
  String body = "${event.notification!.body}";
  await flutterLocalNotificationsPlugin
      .show(200, title, body, notificationDetails, payload: payload);
}

void initLocalNotification() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings("app_icon");

  const IOSInitializationSettings initializationSettingsIOS =
  IOSInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) =>
          handleNotificationsTap(payload));
}

Future<void> registerNotification() async {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  await firebaseMessaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
}

void initializeFlutterFire() async => await registerNotification();

handleNotificationsTap(String? payload) async {
  log('payload is $payload');

  if (payload!.isEmpty || payload == '{}') {
    // NavigationService.navigateTo(
    //   const NotificationsView(),
    // );
  } else {
    List<String> str =
    payload.replaceAll("{", "").replaceAll("}", "").split(",");
    Map<String, dynamic> data = {};
    for (int i = 0; i < str.length; i++) {
      List<String> s = str[i].split(":");
      data.putIfAbsent(s[0].trim(), () => s[1].trim());
    }
    MagicRouter.navigateTo(const NotificationScreen());
  }
}

void saveFcmToken() async {
  var token = await FirebaseMessaging.instance.getToken();
  log("Firebase Fcm token : ${token.toString()}");
  print("Firebase Fcm token : ${token.toString()}");
}

void setupNotifications() {
  saveFcmToken();
  initializeFlutterFire();
  initLocalNotification();
  requestPermissions();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
    if (event.data != {}) {
      showNotification(event, "${event.data}");
      handleNotificationsTap(event.data.toString());
    } else {
      showNotification(event, "${event.notification}");
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {
    handleNotificationsTap(event.data.toString());
  });
  log("Notifications init complete");
}
