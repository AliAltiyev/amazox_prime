import 'package:domain/domain.dart';

class FetchProductsUseCase {
  final ProductRepository _repository;

  const FetchProductsUseCase({
    required ProductRepository repository,
  }) : _repository = repository;

  Future<List<Product>> call() async => await _repository.fetchProducts();
}
