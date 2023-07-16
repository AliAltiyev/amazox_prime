import 'package:domain/domain.dart';
import 'package:domain/entity/cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetAllCartItemsUseCase _getAllCartItemsUseCase;
  final AddCartItemUseCase _addCartItemUseCase;
  final RemoveCartItemUseCase _removeCartItemUseCase;

  CartBloc({
    required GetAllCartItemsUseCase getAllCartItemsUseCase,
    required AddCartItemUseCase addCartItemUseCase,
    required RemoveCartItemUseCase removeCartItemUseCase,
  })  : _getAllCartItemsUseCase = getAllCartItemsUseCase,
        _addCartItemUseCase = addCartItemUseCase,
        _removeCartItemUseCase = removeCartItemUseCase,
        super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
  }

  void _onLoadCart(
    LoadCart event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    try {
      emit(CartLoaded(cart: Cart(cartItems: _getAllCartItemsUseCase())));
    } catch (_) {
      emit(CartError());
    }
  }

  void _onAddProduct(
    AddProduct event,
    Emitter<CartState> emit,
  ) {
    if (state is CartLoaded) {
      try {
        _addCartItemUseCase.add(event.product);
        emit(
          CartLoaded(
            cart: Cart(
              cartItems: List.from((state as CartLoaded).cart.cartItems)
                ..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(CartError());
      }
    }
  }

  void _onRemoveProduct(
    RemoveProduct event,
    Emitter<CartState> emit,
  ) {
    if (state is CartLoaded) {
      try {
        _removeCartItemUseCase.remove(event.product);
        emit(
          CartLoaded(
            cart: Cart(
              cartItems: List.from((state as CartLoaded).cart.cartItems)
                ..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(CartError());
      }
    }
  }
}
