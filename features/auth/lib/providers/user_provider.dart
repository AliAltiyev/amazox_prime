import 'package:auth/auth.dart';

class UserProvider extends ChangeNotifier {
  UserEntity? _user;

  UserEntity? get user => _user;

  void initUser(UserEntity? user) {
    if (_user != user) {
      _user = user;
      notifyListeners();
    }
  }

  set user(UserEntity? user) {
    if (_user != user) {
      _user = user;
      notifyListeners();
    }
  }
}
