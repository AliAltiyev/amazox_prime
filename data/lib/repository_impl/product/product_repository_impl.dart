import 'package:data/data.dart';

final class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource _remoteDataSource;
  final Connection _connection;
  final LocaleDataSource _localeDataSource;
  ProductRepositoryImpl(
    RemoteDataSource remoteDataSource,
    Connection connection,
    LocaleDataSource localeDataSource,
  )   : _remoteDataSource = remoteDataSource,
        _connection = connection,
        _localeDataSource = localeDataSource;

  @override
  Future<List<Product>> fetchProducts() async {
    if (await _connection.isConnected()) {
      final List<ProductModel> data = await _remoteDataSource.getProducts();
      await _localeDataSource.addProducts(data);

      return data
          .map((model) => ProductMapper.toEntity(model))
          .toList()
          .cast<Product>();
    } else {
      final List<ProductModel> data = _localeDataSource.getAllProdducts();
      return data
          .map((model) => ProductMapper.toEntity(model))
          .toList()
          .cast<Product>();
    }
  }

  @override
  Future<Product> fetchProductById(int productId) async {
    final ProductModel data =
        await _remoteDataSource.getProductsById(productId);
    return ProductMapper.toEntity(data);
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
