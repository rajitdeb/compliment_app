class ComplimentModel {
  String image;
  String text;

  ComplimentModel({required this.image, required this.text});

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{
      'image': image,
      'text': text,
    };
    return map;
  }
}
