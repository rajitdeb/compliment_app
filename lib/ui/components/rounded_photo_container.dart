import 'package:flutter/material.dart';

class RoundedPhotoContainer extends StatelessWidget {
  final String assetImagePath;

  const RoundedPhotoContainer({super.key, required this.assetImagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      width: 140.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetImagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}
