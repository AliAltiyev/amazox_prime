abstract class ThemeRepository {
  Future<void> saveAppTheme(bool isDark);

  Future<bool> getAppTheme(String key);
}
