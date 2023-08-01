import 'package:domain/domain.dart';

abstract class BaseUserRepository {
  Stream<UserEntity> getUser(String userId);
  Future<void> createUser(UserEntity user);
  Future<void> updateUser(UserEntity user);
}
