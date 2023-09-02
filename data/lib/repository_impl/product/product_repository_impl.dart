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
    final Box<ProductModel> productsBox = Hive.box(LocaleStorage.products.name);
    if (await _connection.isConnected()) {
      final List<ProductModel> data = await _remoteDataSource.getProducts();
      if (productsBox.isNotEmpty) {
        productsBox.clear();
      }
      await _localeDataSource.addProducts(data);

      return data.map(ProductMapper.toEntity).toList().cast<Product>();
    } else {
      final List<ProductModel> data = _localeDataSource.getAllProducts();
      return data.map(ProductMapper.toEntity).toList().cast<Product>();
    }
  }

  @override
  Future<Product> fetchProductById(int productId) async {
    if (await _connection.isConnected()) {
      final ProductModel data =
          await _remoteDataSource.getProductsById(productId);
      return ProductMapper.toEntity(data);
    } else {
      final ProductModel data =
          await _localeDataSource.getProductById(productId);
      return ProductMapper.toEntity(data);
    }
  }

  @override
  Future<List<Menu>> fetchMenu() async {
    final List<MenuModel> data = await _remoteDataSource.getMenu();
    return data.map(MenuMapper.toEntity).toList().cast<Menu>();
  }
}
