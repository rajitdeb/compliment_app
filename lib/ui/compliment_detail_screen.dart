import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/data/compliment_provider.dart';
import '/ui/components/back_arrow_button.dart';
import '/ui/components/rounded_photo_container.dart';

import '../util/constants.dart';

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
                // Compliment Detail Screen Background Image
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

                // Back Button - Pops the current screen from Back Stack
                BackArrowButton(onPressed: () => Navigator.pop(context)),

                // Main Content
                Positioned.fill(
                  top: 56.0, // Secured the back arrow button
                  child: ListView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20),

                            // Page Title
                            Text(
                              "Compliment Of\nThe Day",
                              textAlign: TextAlign.center,
                              style: kComplimentDetailScreenPageTitleTextStyle,
                            ),
                            const SizedBox(height: 32.0),

                            // Flash Photo
                            RoundedPhotoContainer(
                              assetImagePath: complimentProvider
                                  .compliments[int.parse(payload)].image,
                            ),
                            SizedBox(height: 25.0),

                            // Compliment Text
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
                                style:
                                    kComplimentDetailScreenComplimentTextStyle,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
