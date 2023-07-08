import 'package:complimentapp/util/strings.dart';

class CompliModel {
  String image;
  String text;

  CompliModel({required this.image, required this.text});

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{
      'image': image,
      'text': text,
    };
    return map;
  }

  static List<CompliModel> compli = [
    CompliModel(text: Strings.day1, image: "assets/images/day-1.jfif"),
    CompliModel(text: Strings.day2, image: "assets/images/day-2.jfif"),
    CompliModel(text: Strings.day3, image: "assets/images/day-3.png"),
    CompliModel(text: Strings.day4, image: "assets/images/day-4.jfif"),
    CompliModel(text: Strings.day5, image: "assets/images/day-5.jfif"),
    CompliModel(text: Strings.day6, image: "assets/images/day-6.png"),
    CompliModel(text: Strings.day7, image: "assets/images/day-7.jfif"),
    CompliModel(text: Strings.day8, image: "assets/images/day-8.png"),
    CompliModel(text: Strings.day9, image: "assets/images/day-9.png"),
    CompliModel(text: Strings.day10, image: "assets/images/day-10.jfif"),
  ];
}
