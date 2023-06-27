import 'package:core/resources/style_manager.dart';
import 'package:core/resources/values_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData get theme {
  return ThemeData(
    useMaterial3: true,
    primaryColor: ColorManager.char,
    fontFamily: FontManager.poppins,
    cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(ApplicationSize.s8))),
        elevation: ApplicationSize.s4),
    appBarTheme: AppBarTheme(
      titleTextStyle: StyleManager.getMediumFontStyle(
          fontFamily: FontManager.poppins,
          color: Colors.black,
          fontWeight: FontWeightEnum.medium.getWeight),
      centerTitle: true,
      color: Colors.white,
      elevation: ApplicationSize.s0,
    ),
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
    ),

    //?Text theme
    textTheme: TextTheme(
        displayLarge: StyleManager.getMediumFontStyle(
            fontWeight: FontWeightEnum.medium.getWeight,
            fontSize: ApplicationSize.s57),
        displayMedium: StyleManager.getMediumFontStyle(
            fontWeight: FontWeightEnum.medium.getWeight,
            fontSize: ApplicationSize.s45),
        displaySmall: StyleManager.getMediumFontStyle(
            fontWeight: FontWeightEnum.medium.getWeight,
            fontSize: ApplicationSize.s36),
        headlineLarge: StyleManager.getMediumFontStyle(
            fontWeight: FontWeightEnum.medium.getWeight,
            fontSize: ApplicationSize.s32),
        headlineMedium: StyleManager.getMediumFontStyle(
            fontWeight: FontWeightEnum.medium.getWeight,
            fontSize: ApplicationSize.s28),
        headlineSmall: StyleManager.getMediumFontStyle(
            fontWeight: FontWeightEnum.medium.getWeight,
            fontSize: ApplicationSize.s24),
        titleLarge: StyleManager.getBoldFontStyle(
            fontWeight: FontWeightEnum.medium.getWeight,
            fontSize: ApplicationSize.s22),
        titleMedium: StyleManager.getBoldFontStyle(
            fontWeight: FontWeightEnum.medium.getWeight,
            fontSize: ApplicationSize.s16),
        titleSmall: StyleManager.getBoldFontStyle(
            fontWeight: FontWeightEnum.medium.getWeight,
            fontSize: ApplicationSize.s14,
            color: ColorManager.white)),
    inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
  );
}
