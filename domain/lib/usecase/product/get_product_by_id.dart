import 'package:domain/domain.dart';

class FetchProductByIdUseCase {
  final ProductRepository _repository;

  FetchProductByIdUseCase({
    required ProductRepository repository,
  }) : _repository = repository;

  Future<Product> call(int prodcuId) async =>
      await _repository.fetchProductById(prodcuId);
}