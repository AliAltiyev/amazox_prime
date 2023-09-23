import 'package:data/data.dart';

abstract class RemoteAdminDataSource {
  Future<List<int>> getUsersPerDay();
  Future<List<UserModel>> getUsersByRegistrationDate();
}
