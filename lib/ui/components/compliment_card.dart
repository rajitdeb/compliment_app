import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/util/constants.dart';
import '../../data/compliment_provider.dart';

class ComplimentCard extends StatelessWidget {
  final int index;

  ComplimentCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<ComplimentProvider>(
      builder: (context, complimentProvider, child) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Complement Day Text
                Text(
                  "Day: ${index + 1}",
                  style: kComplimentCardTextStyle.copyWith(fontSize: 16.0),
                ),
                SizedBox(width: 15.0),

                // Complement Text
                Flexible(
                  child: Text(
                    complimentProvider.compliments[index].text,
                    style: kComplimentCardTextStyle.copyWith(fontSize: 15.0),
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
