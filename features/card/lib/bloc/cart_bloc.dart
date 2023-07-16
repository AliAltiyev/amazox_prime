import 'package:domain/domain.dart';
import 'package:domain/entity/cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<CartProductAdded>(_addToCart);
    on<CartProductRemoved>(_removeFromCart);
  }

  _addToCart(CartProductAdded event, Emitter<CartState> emit) {
    emit(
      state.copyWith(
        cart: Cart(
          cartItems: List.from(state.cart.cartItems)..add(event.product),
        ),
      ),
    );
  }

  void _removeFromCart(CartProductRemoved event, Emitter<CartState> emit) {
    emit(CartState(
        cart: Cart(
            cartItems: List.from(state.cart.cartItems)..add(event.product))));
  }
}
