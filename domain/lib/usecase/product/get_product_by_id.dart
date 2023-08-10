import 'package:domain/domain.dart';

class FetchProductByIdUseCase {
  final ProductRepository _repository;

  const FetchProductByIdUseCase({
    required ProductRepository repository,
  }) : _repository = repository;

  Future<Product> call(int productId) =>
      _repository.fetchProductById(productId);
}
