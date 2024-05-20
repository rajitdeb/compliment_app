import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/shared_pref_provider.dart';
import '../ui/home_screen.dart';
import '../util/constants.dart';
import '/ui/components/compliment_list.dart';

class AllComplimentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<SharedPrefProvider>(context).getKey();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // All Compliments Screen Background Image
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
            Column(
              children: [
                // Back Button
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        // Go back to Home Screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      child: Image.asset(
                        "assets/images/back_arrow.png",
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                  ),
                ),
                Provider.of<SharedPrefProvider>(context).data == 0
                    ? Expanded(
                        child: Center(
                          child: Container(
                            child: Text(
                              "No Compliment for today !!!\n Come Tomorrow 😊.",
                              textAlign: TextAlign.center,
                              style: kAllComplementScreenEmptyTextStyle,
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ComplimentList(),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
