import 'package:data/data.dart';

abstract class RemoteDataSource {
  Future<List<ProductModel>> getProducts();

  Future<List<MenuModel>> getMenu();

  Future<ProductModel> getProductsById(int productId);
}
