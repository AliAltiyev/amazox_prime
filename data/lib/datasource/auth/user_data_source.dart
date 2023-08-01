import 'package:data/model/user.dart';

abstract class UserDataSource {
  Stream<UserModel> getUser(String userId);
  Future<void> createUser(UserModel user);
  Future<void> updateUser(UserModel user);
}
