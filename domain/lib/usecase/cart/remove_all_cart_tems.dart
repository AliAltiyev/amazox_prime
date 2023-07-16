import 'package:domain/repository/cart/cart_repository.dart';

final class RemoveAllCartItemsUseCase {
  final CartRepository _cartRepository;

  RemoveAllCartItemsUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  Future<void> call() async {
    _cartRepository.removeAllCartItems();
  }
}
