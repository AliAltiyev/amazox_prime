import 'package:core/resources/values_manager.dart';
import 'package:flutter/material.dart';

import 'font_manager.dart';

class StyleManager {
  static TextStyle _getTextStyle(
          {required String fontFamily,
          required Color color,
          required FontWeight fontWeight,
          double fontSize = FontSize.s14}) =>
      TextStyle(
          color: color,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          fontSize: fontSize);

//Regular font style
  static TextStyle getMediumFontStyle(
      {String fontFamily = FontManager.poppins,
      Color color = Colors.black,
      FontWeight? fontWeight,
      double fontSize = ApplicationSize.s14}) {
    return _getTextStyle(
        fontFamily: FontManager.poppins,
        color: color,
        fontWeight: FontWeightEnum.medium.getWeight,
        fontSize: fontSize);
  }

  //Bold font style
  static TextStyle getBoldFontStyle(
      {String fontFamily = FontManager.poppins,
      Color color = Colors.black,
      FontWeight? fontWeight,
      double fontSize = ApplicationSize.s14}) {
    return _getTextStyle(
        fontFamily: FontManager.poppins,
        color: color,
        fontWeight: FontWeightEnum.bold.getWeight,
        fontSize: fontSize);
  }

  //Thin font style
  static TextStyle getThinFontStyle(
      {String fontFamily = FontManager.poppins,
      Color color = Colors.black,
      FontWeight? fontWeight,
      double fontSize = ApplicationSize.s14}) {
    return _getTextStyle(
        fontFamily: FontManager.poppins,
        color: color,
        fontWeight: FontWeightEnum.thin.getWeight,
        fontSize: fontSize);
  }
}
