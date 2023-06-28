import 'package:data/data.dart';

final class RepositoryImpl implements ProductRepository {
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(
    RemoteDataSource remoteDataSource,
  ) : _remoteDataSource = remoteDataSource;

  @override
  Future<List<Product>> fetchProducts() async {
    final List<ProductModel> data = await _remoteDataSource.getCoffees();
    return data
        .map((model) => ProductMapper.toEntity(model))
        .toList()
        .cast<Product>();
  }
}
