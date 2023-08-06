import 'package:core/exceptions/cache.dart';
import 'package:data/data.dart';

final class UserLocaleImpl extends UserLocale {
  final Box<bool> _userStateBox;

  UserLocaleImpl({required Box<bool> userStateBox})
      : _userStateBox = userStateBox;

  @override
  Future<void> saveUserFirstTime() async {
    try {
      await _userStateBox.put(LocaleStorage.userAuth.name, false);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> checkUserIfExists() async {
    try {
      return _userStateBox.get(LocaleStorage.userAuth.name) ?? true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
