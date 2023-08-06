import 'package:data/data.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();

  Future<void> logOut();

  Future<void> forgotPassword(String email);

  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<void> signUp({
    required String email,
    required String fullName,
    required String password,
  });
}
