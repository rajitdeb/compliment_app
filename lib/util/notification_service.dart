import 'package:complimentapp/ui/compliment_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;

import '../main.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  SharedPreferences? _prefs;
  int data = -1;

  List<DateTime> dates = [
    DateTime(2023, 07, 08, 16, 10, 00),
    DateTime(2023, 07, 08, 16, 11, 00),
    DateTime(2023, 07, 08, 16, 12, 00),
    DateTime(2023, 07, 08, 16, 13, 00),
    DateTime(2023, 07, 08, 16, 14, 00),
    DateTime(2023, 07, 08, 16, 15, 00),
    DateTime(2023, 07, 08, 16, 16, 00),
    DateTime(2023, 07, 08, 16, 17, 00),
    DateTime(2023, 07, 08, 16, 18, 00),
    DateTime(2023, 07, 08, 16, 19, 00),
    DateTime(2023, 07, 08, 16, 20, 00),
  ];

  Future<void> initNotification() async {
    await Permission.notification.isDenied.then((value) {
      if (value) {
        Permission.notification.request();
      }
    });
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: selectNotification);
    scheduleNotification();
  }

  selectNotification(
    NotificationResponse response,
  ) async {
    _prefs = await SharedPreferences.getInstance();

    if (_prefs!.getInt("payload") != null) {
      data = _prefs!.getInt("payload")!;
    }

    _prefs!.setInt("payload", int.parse(response.payload!));

    if (data < int.parse(response.payload!)) {
      await notificationsPlugin.cancel(int.parse(response.payload!));

      await Navigator.push(
        navigatorKey.currentContext!,
        MaterialPageRoute(
            builder: (context) =>
                ComplimentDetailScreen(payload: response.payload!)),
      );
    }
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  // Future showNotification(
  //     {int id = 0, String? title, String? body, String? payLoad}) async {
  //   return notificationsPlugin.show(
  //       id, title, body, await notificationDetails());
  // }

  Future<void> scheduleNotification() async {
    for (var i = 0; i <= 9; i++) {
      await notificationsPlugin.zonedSchedule(
        i,
        'Hey Flash',
        'Check surprise of Day-$i',
        tz.TZDateTime.from(dates[i], tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'your_channel_id',
            'your_channel_name',
          ),
        ),
        payload: '$i',
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
  }
}
