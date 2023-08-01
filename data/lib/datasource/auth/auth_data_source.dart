import 'package:data/model/user.dart';

abstract class AuthDataSource {
  Stream<UserModel?> get user;
  Future<UserModel?> signUp({
    required String password,
    required UserModel user,
  });
  Future<void> logInWithGoogle();
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signOut();
}
