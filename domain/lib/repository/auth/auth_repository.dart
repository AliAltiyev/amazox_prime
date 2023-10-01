import 'package:domain/domain.dart';

abstract class AuthRepository {
  const AuthRepository();

  Stream<UserEntity> getCurrentUser();

  ResultFuture<UserEntity> signInWithGoogle();

  ResultFuture<UserEntity> signIn({
    required String email,
    required String password,
  });

  ResultFuture<void> signUp({
    required String email,
    required String fullName,
    required String password,
  });

  ResultFuture<void> forgotPassword(String email);

  ResultFuture<void> logOut();
}
