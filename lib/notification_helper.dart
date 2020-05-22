import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';

NotificationDetails get _noSound {
  final androidChannelSpecifics = AndroidNotificationDetails(
    'silent channel id',
    'silent channel name',
    'silent channel description',
    playSound: false,
  );
  final iOSChannelSpecifics = IOSNotificationDetails(presentSound: false);

  return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
}

Future _showNotification(
  FlutterLocalNotificationsPlugin notifications, {
  @required String title,
  @required String body,
  @required NotificationDetails type,
  int id = 0,
}) =>
    notifications.show(id, title, body, type);

//Future<void> noti() async {
//  var time = new Time(10, 0, 0);
//  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//      'show weekly channel id',
//      'show weekly channel name',
//      'show weekly description');
//  var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
//  var platformChannelSpecifics = new NotificationDetails(
//      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//  var flutterLocalNotificationsPlugin;
//  await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
//      0,
//      'show weekly title',
//      'Weekly notification shown on Monday at approximately ${_toTwoDigitString(time.hour)}:${_toTwoDigitString(time.minute)}:${_toTwoDigitString(time.second)}',
//      Day.Monday,
//      time,
//      platformChannelSpecifics);
//}


