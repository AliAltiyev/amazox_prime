abstract class LocaleDataSource {
  Future<void> saveAppTheme(bool isDark);

  Future<bool> getAppTheme(String key);
}
