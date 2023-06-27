import 'package:complimentapp/util/strings.dart';

class CompliModel {
  String image;
  String text;

  CompliModel({required this.image,required this.text});

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{
      'image': image,
      'text': text,
    };
    return map;
  }

  static List<CompliModel> compli = [
    CompliModel(text: Strings.day1, image: "assets/images/day-1.jpg"),
    CompliModel(text: Strings.day2, image: "assets/images/day-2.JPG"),
    CompliModel(text: Strings.day3, image: "assets/images/day-3.png"),
    CompliModel(text: Strings.day4, image: "assets/images/day-4.png"),
    CompliModel(text: Strings.day5, image: "assets/images/day-5.JPG"),
    CompliModel(text: Strings.day6, image: "assets/images/day-6.png"),
    CompliModel(text: Strings.day7, image: "assets/images/day-7.JPG"),
    CompliModel(text: Strings.day8, image: "assets/images/day-8.png"),
    CompliModel(text: Strings.day9, image: "assets/images/day-9.png"),
    CompliModel(text: Strings.day10, image: "assets/images/day-10.JPG"),
    CompliModel(text: Strings.day11, image: "assets/images/day-11.png"),
    CompliModel(text: Strings.day12, image: "assets/images/day-12.jpg"),
    CompliModel(text: Strings.day13, image: "assets/images/day-13.png"),
    CompliModel(text: Strings.day14, image: "assets/images/day-14.png"),
    CompliModel(text: Strings.day15, image: "assets/images/day-15.JPG"),
    CompliModel(text: Strings.day16, image: "assets/images/day-16.png"),
    CompliModel(text: Strings.day17, image: "assets/images/day-17.png"),
    CompliModel(text: Strings.day18, image: "assets/images/day-18.png"),
    CompliModel(text: Strings.day19, image: "assets/images/day-19.jpg"),
    CompliModel(text: Strings.day20, image: "assets/images/day-20.JPG"),
    CompliModel(text: Strings.day21, image: "assets/images/day-21.JPG"),
    CompliModel(text: Strings.day22, image: "assets/images/day-22.png"),
    CompliModel(text: Strings.day23, image: "assets/images/day-23.jpg"),
    CompliModel(text: Strings.day24, image: "assets/images/day-24.png"),
    CompliModel(text: Strings.day25, image: "assets/images/day-25.JPG"),
    CompliModel(text: Strings.day26, image: "assets/images/day-26.png"),
    CompliModel(text: Strings.day27, image: "assets/images/day-27.png"),
    CompliModel(text: Strings.day28, image: "assets/images/day-28.JPG"),
    CompliModel(text: Strings.day29, image: "assets/images/day-29.png"),
    CompliModel(text: Strings.day30, image: "assets/images/day-30.jpg"),
    CompliModel(text: Strings.day31, image: "assets/images/day-31.jpg"),

  ];
}
