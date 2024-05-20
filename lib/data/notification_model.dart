class NotificationModel {
  final String image;
  final String text;

  NotificationModel({required this.image, required this.text});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'image': image,
      'text': text,
    };
    return map;
  }
}
