import 'package:core_ui/core_ui.dart';

class LightTheme extends AppTheme {
  static LightTheme? _instance;
  static LightTheme get instance {
    _instance ??= LightTheme._init();
    return _instance!;
  }

  LightTheme._init();

  ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: ApplicationColors.primaryButtonColor,
    primaryColorLight: ApplicationColors.black,
    primaryColorDark: ApplicationColors.primaryButtonColor,
    canvasColor: ApplicationColors.white,
    scaffoldBackgroundColor: ApplicationColors.white,
    cardColor: ApplicationColors.white,
    dividerColor: ApplicationColors.black,
    unselectedWidgetColor: ApplicationColors.black,
    disabledColor: ApplicationColors.black,
    secondaryHeaderColor: ApplicationColors.white,
    dialogBackgroundColor: ApplicationColors.white,
    indicatorColor: ApplicationColors.canvasColor,
    hintColor: ApplicationColors.black,
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      minWidth: Dimensions.SIZE_88,
      height: Dimensions.SIZE_36,
      padding: EdgeInsets.only(
        top: ApplicationPadding.PADDING_10,
        bottom: ApplicationPadding.PADDING_10,
        left: ApplicationPadding.PADDING_10,
        right: ApplicationPadding.PADDING_10,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ApplicationColors.white,
          width: Dimensions.SIZE_0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.SIZE_10),
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: ApplicationColors.black,
      opacity: Dimensions.SIZE_1,
      size: Dimensions.SIZE_24,
    ),
    primaryIconTheme: const IconThemeData(
      color: ApplicationColors.black,
      opacity: Dimensions.SIZE_1,
      size: Dimensions.SIZE_24,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: ApplicationColors.black,
      unselectedLabelColor: ApplicationColors.scaffoldBackgroundColor,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: ApplicationColors.white,
      brightness: Brightness.light,
      deleteIconColor: ApplicationColors.black,
      disabledColor: ApplicationColors.black,
      labelPadding: const EdgeInsets.only(
        top: Dimensions.SIZE_0,
        bottom: Dimensions.SIZE_0,
        left: Dimensions.SIZE_8,
        right: Dimensions.SIZE_8,
      ),
      labelStyle: const TextStyle(
        color: ApplicationColors.black,
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      secondaryLabelStyle: AppFonts.normal14,
      secondarySelectedColor: ApplicationColors.primaryButtonColor,
      selectedColor: ApplicationColors.black,
      shape: const StadiumBorder(
        side: BorderSide(
          color: ApplicationColors.white,
          width: Dimensions.SIZE_0,
          style: BorderStyle.none,
        ),
      ),
    ),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: Dimensions.SIZE_0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            Dimensions.SIZE_0,
          ),
        ),
      ),
    ),
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
