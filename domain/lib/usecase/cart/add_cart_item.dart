import 'package:domain/domain.dart';

final class AddCartItemUseCase {
  final CartRepository _cartRepository;

  const AddCartItemUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  Future<void> add(Product product) async {
    _cartRepository.addCartItem(product);
  }
}
