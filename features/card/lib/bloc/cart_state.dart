part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => <Object>[];
}

class CartLoading extends CartState {
  @override
  List<Object> get props => <Object>[];
}

class CartLoaded extends CartState {
  final Cart cart;
  final int serviceFee;

  const CartLoaded({
    this.cart = const Cart(),
    this.serviceFee = 70,
  });

  double get subtotal => cart.cartItems.fold(
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
      total(subtotal, deliveryFee, serviceFee).toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  @override
  List<Object> get props => <Object>[
        cart,
      ];
}

class CartFailure extends CartState {
  String message;
  CartFailure({
    required this.message,
  });

  @override
  List<Object> get props => <Object>[
        message,
      ];
}
