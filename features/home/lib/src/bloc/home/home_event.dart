part of 'home_bloc.dart';

@immutable
class ProductsEvent {}

final class FetchProductsEvent extends ProductsEvent {}

final class NavigateToProductDetailsScreenEvent extends ProductsEvent {
  final int productId;

  NavigateToProductDetailsScreenEvent(this.productId);
}
