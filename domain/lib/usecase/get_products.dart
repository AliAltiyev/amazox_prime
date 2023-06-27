import 'package:domain/entity/product.dart';
import 'package:domain/repository/repository.dart';

class GetProductsUseCase {
  final Repository _repository;

  GetProductsUseCase({required Repository repository})
      : _repository = repository;

  Future<List<Product>> call() async => await _repository.getProducts();
}
