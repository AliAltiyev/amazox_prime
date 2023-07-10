import 'package:domain/domain.dart';

final class FetchMenuItemsUseCase {
  final ProductRepository _productsRepository;

  FetchMenuItemsUseCase({
    required ProductRepository productRepository,
  }) : _productsRepository = productRepository;

  Future<List<Menu>> call() => _productsRepository.fetchMenu();
}
