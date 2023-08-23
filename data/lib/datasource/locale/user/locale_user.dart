abstract class UserLocale {
  Future<void> initBox();

  Future<void> saveUserFirstTime();

  Future<bool> checkUserIfExists();
}
