part of 'cart_bloc.dart';

class CartState extends Equatable {
  final Cart cart;

  const CartState({
    this.cart = const Cart(
      cartItems: [],
    ),
  });

  @override
  List<Object?> get props => [
        cart,
      ];

  CartState copyWith({
    Cart? cart,
  }) {
    return CartState(
      cart: cart ?? this.cart,
    );
  }
}
