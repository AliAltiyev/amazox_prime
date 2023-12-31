import 'dart:async';

import 'package:card/shopping_card.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetAllCartItemsUseCase _getAllCartItemsUseCase;
  final AddCartItemUseCase _addCartItemUseCase;
  final RemoveCartItemUseCase _removeCartItemUseCase;
  final RemoveAllCartItemsUseCase _removeAllCartItemsUseCase;
  final SaveUserOrderUseCase _saveUserOrderUseCase;
  final SaveOrderRemoteUseCase _saveOrderRemoteUseCase;

  CartBloc({
    required GetAllCartItemsUseCase getAllCartItemsUseCase,
    required AddCartItemUseCase addCartItemUseCase,
    required SaveUserOrderUseCase saveUserOrderUseCase,
    required RemoveCartItemUseCase removeCartItemUseCase,
    required RemoveAllCartItemsUseCase removeAllCartItemsUseCase,
    required SaveOrderRemoteUseCase saveOrderRemoteUseCase,
  })  : _getAllCartItemsUseCase = getAllCartItemsUseCase,
        _saveOrderRemoteUseCase = saveOrderRemoteUseCase,
        _addCartItemUseCase = addCartItemUseCase,
        _saveUserOrderUseCase = saveUserOrderUseCase,
        _removeCartItemUseCase = removeCartItemUseCase,
        _removeAllCartItemsUseCase = removeAllCartItemsUseCase,
        super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
    on<RemoveAllProducts>(_onRemoveAllProducts);
    on<ConfirmOrder>(_onConfirmOrder);
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
        CartFailure(message: message.toString()),
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
              cartItems:
                  List<Product>.from((state as CartLoaded).cart.cartItems)
                    ..add(event.product),
            ),
          ),
        );
      } catch (message) {
        emit(
          CartFailure(message: message.toString()),
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
              cartItems:
                  List<Product>.from((state as CartLoaded).cart.cartItems)
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

  Future<void> _onRemoveAllProducts(
    RemoveAllProducts event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoaded) {
      await _saveUserOrderUseCase(
        order: UserOrder(
          id: const Uuid().v1(),
          dateTime: date,
          products: (state as CartLoaded).cart.cartItems,
          price: totalPrice,
        ),
      );

      _removeAllCartItemsUseCase();
      emit(
        CartLoaded(
          cart: Cart(
            cartItems: List<Product>.from(
              (state as CartLoaded).cart.cartItems,
            )..clear(),
          ),
        ),
      );
    }
  }

  double get subtotal => (state as CartLoaded).cart.cartItems.fold(
        0,
        (double previousValue, Product element) =>
            previousValue + element.price,
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

  double get totalPrice =>
      total(subtotal, deliveryFee, (state as CartLoaded).serviceFee);

  String get totalString =>
      total(subtotal, deliveryFee, (state as CartLoaded).serviceFee)
          .toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get date => DateTime.now().toString().substring(0, 10);

  Future<void> _onConfirmOrder(
    ConfirmOrder event,
    Emitter<CartState> emit,
  ) async {
    try {
      final List<Product> cart = (state as CartLoaded).cart.cartItems;
      _saveOrderRemoteUseCase(
        order: UserOrder(
          id: const Uuid().v4(),
          dateTime: DateTime.now().toString().substring(0, 10),
          products: cart
              .map((Product e) => Product(
                  name: e.name,
                  description: e.description,
                  image: e.image,
                  price: e.price,
                  ml: e.ml,
                  id: e.id,
                  bigDescription: e.bigDescription,
                  rate: e.rate))
              .toList(),
          price: totalPrice,
        ),
      );
    } catch (message) {
      emit(CartFailure(message: message.toString()));
    }
  }
}
