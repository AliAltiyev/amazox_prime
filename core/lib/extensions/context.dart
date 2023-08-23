import 'package:flutter/material.dart';

extension Context on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
  ThemeData get theme => Theme.of(this);
}
