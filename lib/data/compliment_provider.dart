import 'package:complimentapp/data/compliment_model.dart';
import 'package:flutter/material.dart';

import '../util/strings.dart';

class ComplimentProvider extends ChangeNotifier {
  List<ComplimentModel> compliments = [
    ComplimentModel(text: Strings.day1, image: "assets/images/day-1.jfif"),
    ComplimentModel(text: Strings.day2, image: "assets/images/day-2.jfif"),
    ComplimentModel(text: Strings.day3, image: "assets/images/day-3.png"),
    ComplimentModel(text: Strings.day4, image: "assets/images/day-4.jfif"),
    ComplimentModel(text: Strings.day5, image: "assets/images/day-5.jfif"),
    ComplimentModel(text: Strings.day6, image: "assets/images/day-6.png"),
    ComplimentModel(text: Strings.day7, image: "assets/images/day-7.jfif"),
    ComplimentModel(text: Strings.day8, image: "assets/images/day-8.png"),
    ComplimentModel(text: Strings.day9, image: "assets/images/day-9.png"),
    ComplimentModel(text: Strings.day10, image: "assets/images/day-10.jfif"),
  ];
}
