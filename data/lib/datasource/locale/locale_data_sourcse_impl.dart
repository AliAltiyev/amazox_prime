import 'package:data/data.dart';
import 'package:data/datasource/locale/locale_data_sourse.dart';

final class LocaleDataSourseImpl extends LocaleDataSource {
  LocaleDataSourseImpl();

  @override
  Future<void> saveAppTheme(bool isDark) async {
    final box = await Hive.openBox(
      LocaleStorage.theme.name,
    );
    await box.put(
      LocaleStorage.key.name,
      isDark,
    );
  }

  @override
  Future<bool> getAppTheme(String key) async {
    final box = await Hive.openBox(
      LocaleStorage.theme.name,
    );
    return box.get(key) ?? false;
  }
}
