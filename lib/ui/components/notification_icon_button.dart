import 'package:flutter/material.dart';

class NotificationIconButton extends StatelessWidget {
  final Function onPressed;

  const NotificationIconButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0, right: 30.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: InkWell(
          onTap: () => onPressed(),
          child: Image.asset(
            "assets/images/notification_icon.png",
            height: 60.0,
            width: 60.0,
          ),
        ),
      ),
    );
  }
}
