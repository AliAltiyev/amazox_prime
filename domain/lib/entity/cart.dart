import 'package:domain/domain.dart';

@immutable
final class Cart extends Equatable {
  final List<Product> cartItems;

  const Cart({
    this.cartItems = const <Product>[],
  });

  @override
  List<Object?> get props => [
        cartItems,
      ];
}
