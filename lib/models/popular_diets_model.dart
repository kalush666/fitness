import 'package:flutter/material.dart';

class PopularDietsModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool boxIsSelected;

  PopularDietsModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.boxIsSelected,
  });
  static List<PopularDietsModel> getDiets() {
    List<PopularDietsModel> diets = [
      PopularDietsModel(
        name: 'Honey Pancakes',
        iconPath: 'assets/icons/honey-pancakes.svg',
        level: 'Easy',
        duration: '30mins',
        calorie: '180kcal',
        boxColor: Colors.orange,
        boxIsSelected: true,
      ),
      PopularDietsModel(
        name: 'Canai Bread',
        iconPath: 'assets/icons/canai-bread.svg',
        level: 'Easy',
        duration: '20mins',
        calorie: '230kcal',
        boxColor: Colors.pink,
        boxIsSelected: false,
      ),
    ];
    return diets;
  }
}
