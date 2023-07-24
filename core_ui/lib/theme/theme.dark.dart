import 'package:core_ui/core_ui.dart';

class DarkTheme extends AppTheme {
  static DarkTheme? _instance;
  static DarkTheme get instance {
    _instance ??= DarkTheme._init();
    return _instance!;
  }

  DarkTheme._init();

  ThemeData darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    iconTheme: const IconThemeData(
      color: ApplicationColors.white,
    ),
    appBarTheme: const AppBarTheme(
      color: ApplicationColors.black,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(),
    brightness: Brightness.dark,
    primaryColor: ApplicationColors.primaryColor,
    primaryColorLight: ApplicationColors.black,
    primaryColorDark: ApplicationColors.primaryColorDark,
    canvasColor: ApplicationColors.black,
    scaffoldBackgroundColor: ApplicationColors.black,
    dividerColor: ApplicationColors.dividerColor,
    highlightColor: ApplicationColors.highlightColor,
    splashColor: ApplicationColors.splashColor,
    unselectedWidgetColor: ApplicationColors.unselectedWidgetColor,
    disabledColor: ApplicationColors.disabledColor,
    secondaryHeaderColor: ApplicationColors.secondaryHeaderColor,
    dialogBackgroundColor: ApplicationColors.disabledColor,
    indicatorColor: ApplicationColors.indicatorColor,
    hintColor: ApplicationColors.hintColor,
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      minWidth: Dimensions.SIZE_88,
      height: Dimensions.SIZE_36,
      padding: EdgeInsets.only(
          top: Dimensions.SIZE_0,
          bottom: Dimensions.SIZE_0,
          left: Dimensions.SIZE_16,
          right: Dimensions.SIZE_16),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ApplicationColors.primaryColor,
          width: Dimensions.SIZE_0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.SIZE_2),
        ),
      ),
      alignedDropdown: false,
      buttonColor: ApplicationColors.buttonColor,
      disabledColor: ApplicationColors.primaryColor,
      highlightColor: ApplicationColors.primaryColor,
      splashColor: ApplicationColors.primaryColor,
      focusColor: ApplicationColors.primaryColor,
      hoverColor: ApplicationColors.primaryColor,
      colorScheme: ColorScheme(
        primary: ApplicationColors.primaryColor,
        secondary: ApplicationColors.red,
        surface: ApplicationColors.white,
        background: ApplicationColors.primaryColorLight,
        error: ApplicationColors.red,
        onPrimary: ApplicationColors.white,
        onSecondary: ApplicationColors.white,
        onSurface: ApplicationColors.primaryColor,
        onBackground: ApplicationColors.white,
        onError: ApplicationColors.white,
        brightness: Brightness.dark,
      ),
    ),
    cardColor: ApplicationColors.black,
    textTheme: TextTheme(
      bodySmall: AppFonts.normal12,
      bodyMedium: AppFonts.normal14,
      bodyLarge: AppFonts.normal16,
      labelSmall: AppFonts.bold12,
      labelMedium: AppFonts.bold12,
      labelLarge: AppFonts.bold14,
      titleSmall: AppFonts.normal14,
      titleMedium: AppFonts.normal16,
      titleLarge: AppFonts.bold22,
      headlineSmall: AppFonts.normal24,
      headlineMedium: AppFonts.normal28,
      headlineLarge: AppFonts.normal32,
      displaySmall: AppFonts.normal36,
    ),
  );
}
