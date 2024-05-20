import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

import '../ui/all_compliments_screen.dart';
import '../ui/components/notification_icon_button.dart';
import '../ui/components/photo_grid_row.dart';

import '../util/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: RenderBody()),
    );
  }
}

class RenderBody extends StatefulWidget {
  const RenderBody({super.key});

  @override
  State<RenderBody> createState() => _RenderBodyState();
}

class _RenderBodyState extends State<RenderBody> {
  // Basic Animations
  final GlobalKey<AnimatorWidgetState> basicAnimation =
      GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> basicAnimation1 =
      GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> basicAnimation2 =
      GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> basicAnimation3 =
      GlobalKey<AnimatorWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Home Bac
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Flash Photo Grid
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 30.0),

              // Page Title
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "HEY Flash !!",
                  style: kHomeScreenPageTitleTextStyle,
                ),
              ),

              // Photo Grid Row 1
              PhotoGridRow(
                photoAnimationKey1: basicAnimation,
                assetImage1: "assets/images/main-1.jfif",
                photoAnimationKey2: basicAnimation1,
                assetImage2: "assets/images/main-2.jfif",
              ),

              // Photo Grid Row 2
              PhotoGridRow(
                photoAnimationKey1: basicAnimation2,
                assetImage1: "assets/images/main-3.jfif",
                photoAnimationKey2: basicAnimation3,
                assetImage2: "assets/images/main-4.jfif",
              ),
            ],
          ),
        ),

        // Notification Icon Button
        NotificationIconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AllComplimentsScreen()),
          );
        }),
      ],
    );
  }
}
