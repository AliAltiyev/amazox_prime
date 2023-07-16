part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {}

final class CartInitial extends CartEvent {
  @override
  List<Object?> get props => [];
}

final class CartProductAdded extends CartEvent {
  final Product product;

  CartProductAdded({
    required this.product,
  });

  @override
  List<Object?> get props => [
        product,
      ];
}

final class CartProductRemoved extends CartEvent {
  final Product product;

  CartProductRemoved({
    required this.product,
  });

  @override
  List<Object?> get props => [
        product,
      ];
}
