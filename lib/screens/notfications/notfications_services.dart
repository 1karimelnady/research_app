import 'dart:io';
import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../app_manager/routes_manager.dart';

class NotificationsServices {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  void initLocalNotification(
      BuildContext context, RemoteMessage message) async {
    var androidInitilazationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: androidInitilazationSettings,
      iOS: iosInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) {
      handleMessage(context, message);
    });
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print(" title  ${message.notification!.title.toString()}");
        print(" body ${message.notification!.body.toString()}");
      }
      if (Platform.isIOS) {
        foregroundMessage();
      }
      if (Platform.isAndroid) {
        initLocalNotification(context, message);
        showNotification(message);
      } else {
        showNotification(message);
      }
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(10000).toString(),
        'High Importance Notifications',
        importance: Importance.max);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            channelDescription: 'your channel description',
            priority: Priority.high,
            importance: Importance.high,
            ticker: 'ticker');
    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
      );
    });
  }

  static getper() async {
    NotificationSettings notificationSettings = await FirebaseMessaging.instance
        .requestPermission(
            alert: true,
            badge: true,
            sound: true,
            carPlay: true,
            criticalAlert: true,
            provisional: true);
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.denied) {
      AppSettings.openAppSettings(type: AppSettingsType.notification);
    }
  }

  static Future<String?> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print("firebase token :  $token");
    return token;
  }

  void isRefreshToken() async {
    FirebaseMessaging.instance.onTokenRefresh.listen((event) {
      event.toString();
    });
  }

  Future<void> InteractMessage(BuildContext context) async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  static Future foregroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    if (message.data['type'] == 'علي حسب نوع الرساله') {
      RoutesManager.navigatorPush(context, Widget);
    }
  }

  @pragma('vm:entry-point')
  Future<void> messagingOnBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print(message.notification!.title.toString());
    print(message.notification!.body.toString());
    print(message.data.toString());
  }
}
