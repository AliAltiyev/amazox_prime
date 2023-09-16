import 'package:data/data.dart';

final class AdminRepositoryImpl implements AdminRepository {
  final RemoteAdminDataSource _remoteAdminDataSource;

  AdminRepositoryImpl({
    required RemoteAdminDataSource remoteAdminDataSource,
  }) : _remoteAdminDataSource = remoteAdminDataSource;

  @override
  Future<void> deleteMultipleUsers() {
    // TODO: implement deleteMultipleUsers
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<int>> getUsersPerDay() {
    return _remoteAdminDataSource.getUsersPerDay();
  }
}
