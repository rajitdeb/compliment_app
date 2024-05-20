import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  final Function onPressed;

  const BackArrowButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () => onPressed(),
          child: Image.asset(
            "assets/images/back_arrow.png",
            width: 35.0,
            height: 35.0,
          ),
        ),
      ),
    );
  }
}
