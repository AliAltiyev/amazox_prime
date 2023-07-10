import 'package:data/data.dart';

final class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource _remoteDataSource;

  ProductRepositoryImpl(
    RemoteDataSource remoteDataSource,) : _remoteDataSource = remoteDataSource;

  @override
  Future<List<Product>> fetchProducts() async {
    final List<ProductModel> data = await _remoteDataSource.getCoffees();
    return data
        .map((model) => ProductMapper.toEntity(model))
        .toList()
        .cast<Product>();
  }

  @override
  Future<List<Menu>> fetchMenu() async {
    final List<MenuModel> data = await _remoteDataSource.getMenu();
    return data
        .map((model) => MenuMapper.toEntity(model))
        .toList()
        .cast<Menu>();
  }
}
