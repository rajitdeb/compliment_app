import 'package:complimentapp/all_compliments.dart';
import 'package:complimentapp/compliment_screen.dart';
import 'package:complimentapp/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  NotificationAppLaunchDetails notificationAppLaunchDetails;

  final notifications = FlutterLocalNotificationsPlugin();
  final GlobalKey<AnimatorWidgetState> basicAnimation =
      GlobalKey<AnimatorWidgetState>();

//  List<noti_model> title = [
//    noti_model(
//        image: "assets/images/notification_icon.png", text: "this is first"),
//    noti_model(
//        image: "assets/images/notification_icon.png", text: "this is seccond"),
//    noti_model(
//        image: "assets/images/notification_icon.png", text: "this is third"),
//    noti_model(
//        image: "assets/images/notification_icon.png", text: "this is four"),
//    noti_model(
//        image: "assets/images/notification_icon.png", text: "this is five"),
//    noti_model(
//        image: "assets/images/notification_icon.png", text: "this is six"),
//    noti_model(
//        image: "assets/images/notification_icon.png", text: "this is seven"),
//  ];

  List<DateTime> dates = [
    DateTime(2020, 05, 23, 01, 40, 00),
    DateTime(2020, 05, 23, 01, 41, 00),
    DateTime(2020, 05, 23, 22, 42, 00),
    DateTime(2020, 05, 23, 22, 43, 00),
    DateTime(2020, 05, 23, 22, 14, 00),
    DateTime(2020, 05, 23, 22, 54, 00),
    DateTime(2020, 05, 23, 22, 54, 00),
    DateTime(2020, 05, 23, 22, 58, 00),
    DateTime(2020, 05, 23, 23, 03, 00),
    DateTime(2020, 05, 23, 23, 05, 00),
    DateTime(2020, 05, 23, 23, 10, 00),
    DateTime(2020, 05, 23, 22, 52, 00),
    DateTime(2020, 05, 23, 22, 52, 00),
    DateTime(2020, 05, 23, 22, 53, 00),
    DateTime(2020, 05, 23, 22, 53, 00),
    DateTime(2020, 05, 23, 22, 53, 00),
    DateTime(2020, 05, 23, 22, 54, 00),
    DateTime(2020, 05, 23, 22, 54, 00),
    DateTime(2020, 05, 23, 22, 58, 00),
    DateTime(2020, 05, 23, 23, 03, 00),
    DateTime(2020, 05, 22, 23, 05, 00),
    DateTime(2020, 05, 22, 23, 10, 00),
    DateTime(2020, 05, 22, 22, 52, 00),
    DateTime(2020, 05, 22, 22, 52, 00),
    DateTime(2020, 05, 22, 22, 53, 00),
    DateTime(2020, 05, 22, 22, 53, 00),
    DateTime(2020, 05, 22, 22, 53, 00),
    DateTime(2020, 05, 22, 22, 54, 00),
    DateTime(2020, 05, 22, 22, 54, 00),
    DateTime(2020, 05, 22, 22, 58, 00),
    DateTime(2020, 05, 22, 23, 03, 00),
  ];

  SharedPreferences _prefs;
  int data = -1;

  @override
  void initState() {
    super.initState();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('drawable/app_icon');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
    setNotification();
  }

  setNotification() async {
    _prefs = await SharedPreferences.getInstance();

    if (_prefs.getInt("notification") == null) {
      _prefs.setInt("notification", 0);
      _scheduleNotification();
    }
  }

  Future<void> _scheduleNotification() async {
    print("hello");
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 5));

    notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your other channel id',
      'your other channel name',
      'your other channel description',
    );
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound: 'slow_spring_board.aiff');
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    for (var i = 0; i <= 30; i++) {
      print('Day ${i + 1}');
      print(dates[i]);
      await flutterLocalNotificationsPlugin.schedule(
          i,
          'Hey Nikka',
          'Have You Checked Your Today\'s Surprise ????',
          dates[i],
          platformChannelSpecifics,
          payload: '''$i''');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/back.png"),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "HEY NIKKA !!",
                      style: TextStyle(
                          color: Color(0xfffdd05a),
                          fontSize: 40,
                          fontFamily: 'knewave'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setAnimation();
                          },
                          child: BounceIn(
                            key: basicAnimation,
                            child: Container(
                              height: 180,
                              width: 145,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 8, color: Color(0xffe6dcca)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/main-1.png"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setAnimation();
                          },
                          child: BounceIn(
                            key: basicAnimation,
                            child: Container(
                              height: 180,
                              width: 145,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 8, color: Color(0xffe6dcca)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/main-2.png"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setAnimation();
                          },
                          child: BounceIn(
                            key: basicAnimation,
                            child: Container(
                              height: 180,
                              width: 145,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 8, color: Color(0xffe6dcca)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/main-3.png"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setAnimation();
                          },
                          child: BounceIn(
                            key: basicAnimation,
                            child: Container(
                              height: 180,
                              width: 145,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 8, color: Color(0xffe6dcca)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/main-4.png"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, right: 30),
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllCompli()),
                      );
                    },
                    child: Image.asset("assets/images/notification_icon.png",
                        height: 60, width: 60)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future selectNotification(String payload) async {
    _prefs = await SharedPreferences.getInstance();

    if (_prefs.getInt("payload") != null) {
      data = _prefs.getInt("payload");
    }

    _prefs.setInt("payload", int.parse(payload));

    if (data < int.parse(payload)) {
      if (payload != null) {
        debugPrint('notification payload: ' + payload);
      }

      await flutterLocalNotificationsPlugin.cancel(int.parse(payload));

      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       content:  Text('notification payload: ' + payload),

      //     );
      //   },);
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Compli(payload: payload)),
      );
    }
  }

  void setAnimation() {
    timeDilation = 3.0;
    basicAnimation.currentState.forward();
    timeDilation = 3.0;
    basicAnimation.currentState.reverse();
    timeDilation = 3.0;
    basicAnimation.currentState.forward();
  }
}
