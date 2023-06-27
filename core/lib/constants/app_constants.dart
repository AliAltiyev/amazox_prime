import 'package:flutter/material.dart';

class AppConstants {
  static final AppConstants _instance = AppConstants._init();

  static AppConstants get instance => _instance;

  AppConstants._init();

  var sliverGridDelegateWithFixedCrossAxisCount =
      const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10.0,
    childAspectRatio: 1 / 2,
    crossAxisSpacing: 10.0,
  );

  static const String addToCard = "+ Добавить";
  static const String overTwoHundredStarts = "200+ оценок";
  static const String appName = "Cofix";
  static const String good = 'Отлично';
  static const String search = 'Поиск';
}
