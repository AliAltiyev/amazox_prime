import 'package:data/data.dart';

abstract class RemoteDataSource {
  Future<List<ProductModel>> getCoffees();
  Future<ProductModel> getCoffeeById(int productId);
}
