import 'package:domain/domain.dart';

final class GetAllCartItemsUseCase {
  final CartRepository _cartRepository;

  GetAllCartItemsUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  List<Product> call() => _cartRepository.getCartAllCartItems();
}
