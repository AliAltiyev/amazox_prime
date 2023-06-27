part of 'home_bloc.dart';

abstract class ProductsState {}

final class InitialProductsState extends ProductsState {}

final class LoadingProductsState extends ProductsState {}

final class LoadedProductsState extends ProductsState {
  List<Product> products;

  LoadedProductsState({required this.products});
}

final class ErrorProductsState extends ProductsState {
  final String error;

  ErrorProductsState({required this.error});
}
