import 'package:data/data.dart';

final class ThemeRepositoryImpl extends ThemeRepository {
  final LocaleDataSource _localeDataSource;

  ThemeRepositoryImpl({
    required LocaleDataSource localeDataSource,
  }) : _localeDataSource = localeDataSource;

  @override
  Future<void> saveAppTheme(bool isDark) => _localeDataSource.saveAppTheme(
        isDark,
      );

  @override
  Future<bool> getAppTheme(String key) => _localeDataSource.getAppTheme(
        key,
      );
}
