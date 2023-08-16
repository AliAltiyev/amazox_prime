import 'package:core/exceptions/cache.dart';
import 'package:data/data.dart';

final class UserLocaleImpl extends UserLocale {
  late Box<bool> _userBox;

  @override
  Future<void> saveUserFirstTime() async {
    try {
      await _userBox.put(LocaleStorage.userAuth.name, false);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> checkUserIfExists() async {
    try {
      return _userBox.get(LocaleStorage.userAuth.name) ?? true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> initBox() async {
    _userBox = await Hive.openBox(LocaleStorage.userAuth.name);
  }
}
