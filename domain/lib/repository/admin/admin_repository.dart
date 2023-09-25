import 'package:domain/domain.dart';

abstract class AdminRepository {
  Future<List<int>> getUsersPerDay();
  Future<void> deleteUser();
  Future<void> deleteMultipleUsers();
  Future<List<UserEntity>> getUsersByRegistrationDate();
  Future<void> saveProductToFirebase(Product product);
}
