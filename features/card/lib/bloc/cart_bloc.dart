import 'package:card/shopping_card.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetAllCartItemsUseCase _getAllCartItemsUseCase;
  final AddCartItemUseCase _addCartItemUseCase;
  final RemoveCartItemUseCase _removeCartItemUseCase;
  final RemoveAllCartItemsUseCase _removeAllCartItemsUseCase;

  CartBloc({
    required GetAllCartItemsUseCase getAllCartItemsUseCase,
    required AddCartItemUseCase addCartItemUseCase,
    required RemoveCartItemUseCase removeCartItemUseCase,
    required RemoveAllCartItemsUseCase removeAllCartItemsUseCase,
  })  : _getAllCartItemsUseCase = getAllCartItemsUseCase,
        _addCartItemUseCase = addCartItemUseCase,
        _removeCartItemUseCase = removeCartItemUseCase,
        _removeAllCartItemsUseCase = removeAllCartItemsUseCase,
        super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
    on<RemoveAllProducts>(_removeAllProducts);
  }

  void _onLoadCart(
    LoadCart event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    try {
      emit(
        CartLoaded(
          cart: Cart(
            cartItems: _getAllCartItemsUseCase(),
          ),
        ),
      );
    } catch (message) {
      emit(
        CartFailure(
          message: message.toString(),
        ),
      );
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
      } catch (message) {
        emit(
          CartFailure(
            message: message.toString(),
          ),
        );
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
      } catch (message) {
        emit(
          CartFailure(
            message: message.toString(),
          ),
        );
      }
    }
  }

  FutureOr<void> _removeAllProducts(
    RemoveAllProducts event,
    Emitter<CartState> emit,
  ) {
    if (state is CartLoaded) {
      try {
        _removeAllCartItemsUseCase();
        emit(
          CartLoaded(
            cart: Cart(
              cartItems: List.from((state as CartLoaded).cart.cartItems,)
                ..clear(),
            ),
          ),
        );
      } catch (message) {
        emit(
          CartFailure(
            message: message.toString(),
          ),
        );
      }
    }
  }

  double get subtotal => (state as CartLoaded).cart.cartItems.fold(
        0,
        (previousValue, element) => previousValue + element.price,
      );

  String get getSubtotalString => subtotal.toStringAsFixed(2);

  double deliveryFee(subtotal) {
    if (subtotal >= 2000) {
      return 0;
    } else {
      return 200;
    }
  }

  double total(subtotal, deliveryFee, serviceFee) {
    return subtotal + deliveryFee(subtotal) + serviceFee;
  }

  String get totalString =>
      total(subtotal, deliveryFee, (state as CartLoaded).serviceFee)
          .toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
}
