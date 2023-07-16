import 'package:domain/domain.dart';

final class RemoveCartItemUseCase {
  final CartRepository _cartRepository;

  RemoveCartItemUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  Future<void> remove(Product product) async {
    _cartRepository.removeCartItem(product);
  }
}
