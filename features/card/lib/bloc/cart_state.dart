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
