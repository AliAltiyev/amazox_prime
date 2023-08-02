import 'package:domain/entity/user..dart';

abstract class AuthRepository {
  Stream<UserEntity?> get user;

  Future<UserEntity?> signUp({
    required String password,
    required UserEntity user,
  });

  Future<void> logInWithGoogle();

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> call();

  Stream<void> saveSomeething();
}
