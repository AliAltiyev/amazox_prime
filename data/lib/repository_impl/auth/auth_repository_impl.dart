import 'package:core/core.dart';
import 'package:data/datasource/auth/auth_data_source.dart';
import 'package:data/mapper/user.dart';
import 'package:domain/entity/user..dart';
import 'package:domain/repository/auth/auth_repository.dart';

final class AuthRepositoryimpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  const AuthRepositoryimpl({
    required AuthDataSource authDataSource,
  }) : _authDataSource = authDataSource;

  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _authDataSource.logInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logInWithGoogle() async {
    return await _authDataSource.logInWithGoogle();
  }

  @override
  Future<void> signOut() async {
    return await _authDataSource.signOut();
  }

  @override
  Future<UserEntity?> signUp({
    required String password,
    required UserEntity user,
  }) async {
    final User? currentUser = await _authDataSource.signUp(
        password: password, user: UserMapper.toModel(user));
    return UserMapper.fromUser(currentUser!);
  }

  @override
  Stream<UserEntity?> get user => _authDataSource.user.cast<UserEntity>();
}
