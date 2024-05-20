import 'package:complimentapp/ui/components/animated_photo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/animator_widget.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class PhotoGridRow extends StatelessWidget {
  final Key photoAnimationKey1;
  final String assetImage1;
  final Key photoAnimationKey2;
  final String assetImage2;

  const PhotoGridRow({
    super.key,
    required this.photoAnimationKey1,
    required this.assetImage1,
    required this.photoAnimationKey2,
    required this.assetImage2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Photo 1
          AnimatedPhotoItem(
            photoAnimationKey: photoAnimationKey1,
            onPressed: (value) => setAnimation(value),
            assetImage: assetImage1,
          ),

          // Photo 2
          AnimatedPhotoItem(
            photoAnimationKey: photoAnimationKey2,
            onPressed: (value) => setAnimation(value),
            assetImage: assetImage2,
          ),
        ],
      ),
    );
  }

  // My Optimization
  void setAnimation(GlobalKey<AnimatorWidgetState> key) {
    timeDilation = 3.0;
    key.currentState!.forward();
    timeDilation = 3.0;
    key.currentState!.reverse();
    timeDilation = 3.0;
    key.currentState!.forward();
  }
}
