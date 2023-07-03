import 'package:complimentapp/ui/compliment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;

import '../main.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  SharedPreferences? _prefs;
  int data = -1;

  List<DateTime> dates = [
    DateTime(2023, 07, 04, 00, 40, 00),
    DateTime(2023, 07, 04, 00, 41, 00),
    DateTime(2023, 07, 04, 00, 42, 00),
    DateTime(2023, 07, 04, 00, 43, 00),
    DateTime(2023, 07, 04, 00, 44, 00),
    DateTime(2023, 07, 04, 00, 45, 00),
    DateTime(2023, 07, 04, 00, 46, 00),
    DateTime(2023, 07, 04, 00, 47, 00),
    DateTime(2023, 07, 04, 00, 48, 00),
    DateTime(2023, 07, 04, 00, 49, 00),
    DateTime(2023, 07, 04, 00, 40, 00),
  ];

  Future<void> initNotification() async {

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
    print("data2......");
    scheduleNotification();
  }

  selectNotification(NotificationResponse response,) async {
    
    _prefs = await SharedPreferences.getInstance();

    print("data......" + data.toString());


    if (_prefs!.getInt("payload") != null) {
      data = _prefs!.getInt("payload")!;
    }

    _prefs!.setInt("payload", int.parse(response.payload!));

    if (data < int.parse(response.payload!)) {
      debugPrint('notification payload: ' + response.payload!);

      await notificationsPlugin.cancel(int.parse(response.payload!));
     

      await Navigator.push(
        navigatorKey.currentContext!,
        MaterialPageRoute(
            builder: (context) => Compli(payload: response.payload!)),
      );
    }
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }

  Future<void> scheduleNotification() async {
    print("hello");

    for (var i = 0; i <= 10; i++) {
      print('Day ${i + 1}');
      print(dates[i]);

      await notificationsPlugin.zonedSchedule(
        i,
        'Hey Flash',
        //'Have You Checked Your Today\'s Surprise ???? Day-$i',
         'Have You ??Day-$i',
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
