import 'package:flutter/material.dart';

class FontManager {
  static const String poppins = 'Poppins';
}

enum FontWeightEnum { thin, bold, black, medium }

extension FontWeightEx on FontWeightEnum {
  FontWeight get getWeight {
    switch (this) {
      case FontWeightEnum.thin:
        return FontWeight.w200;

      case FontWeightEnum.medium:
        return FontWeight.w400;

      case FontWeightEnum.bold:
        return FontWeight.w900;
      case FontWeightEnum.black:
        return FontWeight.w800;
    }
  }
}

class FontSize {
  static const double s12 = 12;
  static const double s14 = 14;
  static const double s16 = 16;
  static const double s18 = 18;
  static const double s20 = 20;
  static const double s22 = 22;
  static const double s24 = 24;
  static const double s26 = 26;
}
