import 'package:data/data.dart';
import 'package:data/mapper/user.dart';

class AuthRemoteRepositoryImpl implements AuthRepository {
  const AuthRemoteRepositoryImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<void> forgotPassword(String email) async {
    try {
      await _remoteDataSource.forgotPassword(email);
      return const Right<Failure, void>(null);
    } on ServerException catch (e) {
      return Left<Failure, void>(
        ServerFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  ResultFuture<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserModel result = await _remoteDataSource.signIn(
        email: email,
        password: password,
      );

      return Right<Failure, UserEntity>(UserMapper.toEntity(result));
    } on ServerException catch (e) {
      return Left<Failure, UserEntity>(
          ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<void> signUp({
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      await _remoteDataSource.signUp(
        email: email,
        fullName: fullName,
        password: password,
      );
      return const Right<Failure, void>(null);
    } on ServerException catch (e) {
      return Left<Failure, void>(
        ServerFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  ResultFuture<void> logOut() async {
    try {
      await _remoteDataSource.logOut();
      return const Right<Failure, void>(null);
    } on ServerException catch (e) {
      return Left<Failure, void>(
        ServerFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  ResultFuture<UserEntity> signInWithGoogle() async {
    try {
      final UserModel result = await _remoteDataSource.signInWithGoogle();

      return Right<Failure, UserEntity>(UserMapper.toEntity(result));
    } on ServerException catch (e) {
      return Left<Failure, UserEntity>(
        ServerFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  Stream<UserEntity> getCurrentUser() {
    return _remoteDataSource
        .getCurrentUser()
        .map<UserEntity>(UserMapper.toEntity);
  }
}
