import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/ui/components/compliment_card.dart';
import '../../data/shared_pref_provider.dart';
import '../compliment_detail_screen.dart';

class ComplimentList extends StatelessWidget {
  const ComplimentList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<SharedPrefProvider>(context).data,
      shrinkWrap: true,
      itemBuilder: (context, int index) {
        return InkWell(
          onTap: () {
            // Navigate to Compliment Detail Screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ComplimentDetailScreen(payload: index.toString());
                },
              ),
            );
          },
          child: ComplimentCard(index: index),
        );
      },
    );
  }
}
