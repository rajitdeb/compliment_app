import 'package:complimentapp/util/notification_service.dart';
import 'package:complimentapp/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
      
  tz.initializeTimeZones();
  runApp(MaterialApp(
       navigatorKey: navigatorKey,
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
    
  ));
}
