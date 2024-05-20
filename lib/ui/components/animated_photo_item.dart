import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/bouncing_entrances/bounce_in.dart';

class AnimatedPhotoItem extends StatelessWidget {
  final Key photoAnimationKey;
  final Function onPressed;
  final String assetImage;

  AnimatedPhotoItem({
    super.key,
    required this.photoAnimationKey,
    required this.onPressed,
    required this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    return BounceIn(
      key: photoAnimationKey,
      child: InkWell(
        onTap: () => onPressed(photoAnimationKey),
        child: Container(
          height: 180.0,
          width: 145.0,
          decoration: BoxDecoration(
            border: Border.all(
              width: 8,
              color: Color(0xffe6dcca),
            ),
            image: DecorationImage(
              image: AssetImage(assetImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
