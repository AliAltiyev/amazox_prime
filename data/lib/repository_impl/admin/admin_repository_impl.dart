import 'package:data/data.dart';
import 'package:data/mapper/user.dart';

final class AdminRepositoryImpl implements AdminRepository {
  final RemoteAdminDataSource _remoteAdminDataSource;

  AdminRepositoryImpl({
    required RemoteAdminDataSource remoteAdminDataSource,
  }) : _remoteAdminDataSource = remoteAdminDataSource;
  //TODO remove or do somehing
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

  @override
  Future<List<UserEntity>> getUsersByRegistrationDate() async {
    final List<UserModel> data =
        await _remoteAdminDataSource.getUsersByRegistrationDate();
    return data.map(UserMapper.toEntity).toList();
  }

  @override
  Future<void> saveProductToFirebase(Product product) async {
    final ProductModel mappedProduct = ProductMapper.toModel(product);
    _remoteAdminDataSource.addProduct(mappedProduct);
  }
}
