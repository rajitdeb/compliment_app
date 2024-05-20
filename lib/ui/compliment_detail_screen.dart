import 'package:complimentapp/data/compliment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComplimentDetailScreen extends StatelessWidget {
  final String payload;

  ComplimentDetailScreen({required this.payload});

  @override
  Widget build(BuildContext context) {
    return Consumer<ComplimentProvider>(
      builder: (context, complimentProvider, child) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                // Compliment Screen Background Image
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/noti_back.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 30.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/images/back_arrow.png",
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 65.0),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Compliment Of",
                                style: TextStyle(
                                  fontSize: 45.0,
                                  fontFamily: 'nick',
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "The Day",
                                style: TextStyle(
                                  fontSize: 45.0,
                                  fontFamily: 'nick',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Image.asset(
                        complimentProvider
                            .compliments[int.parse(payload)].image,
                        height: 200.0,
                        width: 160.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        child: Text(
                          complimentProvider
                              .compliments[int.parse(payload)].text
                              .toString()
                              .toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'monster',
                            fontSize: 24.0,
                            color: Colors.white,
                            height: 1.7,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
