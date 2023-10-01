part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => <Object>[];
}

class LoadCart extends CartEvent {}

class AddProduct extends CartEvent {
  final Product product;

  const AddProduct(this.product);

  @override
  List<Object> get props => <Object>[
        product,
      ];
}

class RemoveProduct extends CartEvent {
  final Product product;

  const RemoveProduct(this.product);

  @override
  List<Object> get props => <Object>[
        product,
      ];
}

final class RemoveAllProducts extends CartEvent {
  const RemoveAllProducts();

  @override
  List<Object> get props => <Object>[];
}

final class ConfirmOrder extends CartEvent {
  @override
  List<Object> get props => <Object>[];
}
