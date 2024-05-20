import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;

import '/data/compliment_provider.dart';
import '/data/shared_pref_provider.dart';
import '/util/notification_service.dart';
import '/ui/home_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();

  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ComplimentProvider()),
        ChangeNotifierProvider(create: (_) => SharedPrefProvider()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
