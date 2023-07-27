import 'package:domain/repository/cart/cart_repository.dart';

final class RemoveAllCartItemsUseCase {
  final CartRepository _cartRepository;

  const RemoveAllCartItemsUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  Future<void> call() async {
    _cartRepository.removeAllCartItems();
  }
}
