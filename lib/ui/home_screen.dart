import 'package:complimentapp/ui/all_compliments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

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
                  "HEY Flash !!",
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
                    BounceIn(
                      key: basicAnimation,
                      child: InkWell(
                        onTap: () {
                          setAnimation(basicAnimation);
                        },
                        child: Container(
                          height: 180,
                          width: 145,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 8, color: Color(0xffe6dcca)),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/main-1.jfif"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    BounceIn(
                      key: basicAnimation1,
                      child: InkWell(
                        onTap: () {
                          setAnimation(basicAnimation1);
                        },
                        child: Container(
                          height: 180,
                          width: 145,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 8, color: Color(0xffe6dcca)),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/main-2.jfif"),
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
                    BounceIn(
                      key: basicAnimation2,
                      child: InkWell(
                        onTap: () {
                          setAnimation(basicAnimation2);
                        },
                        child: Container(
                          height: 180,
                          width: 145,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 8, color: Color(0xffe6dcca)),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/main-3.jfif"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    BounceIn(
                      key: basicAnimation3,
                      child: InkWell(
                        onTap: () {
                          setAnimation(basicAnimation3);
                        },
                        child: Container(
                          height: 180,
                          width: 145,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 8, color: Color(0xffe6dcca)),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/main-4.jfif"),
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
    );
  }

  void setAnimation(key) {
    if (key == basicAnimation1) {
      timeDilation = 3.0;
      basicAnimation1.currentState!.forward();
      timeDilation = 3.0;
      basicAnimation1.currentState!.reverse();
      timeDilation = 3.0;
      basicAnimation1.currentState!.forward();
    } else if (key == basicAnimation2) {
      timeDilation = 3.0;
      basicAnimation2.currentState!.forward();
      timeDilation = 3.0;
      basicAnimation2.currentState!.reverse();
      timeDilation = 3.0;
      basicAnimation2.currentState!.forward();
    } else if (key == basicAnimation3) {
      timeDilation = 3.0;
      basicAnimation3.currentState!.forward();
      timeDilation = 3.0;
      basicAnimation3.currentState!.reverse();
      timeDilation = 3.0;
      basicAnimation3.currentState!.forward();
    } else {
      timeDilation = 3.0;
      basicAnimation.currentState!.forward();
      timeDilation = 3.0;
      basicAnimation.currentState!.reverse();
      timeDilation = 3.0;
      basicAnimation.currentState!.forward();
    }
  }
}
