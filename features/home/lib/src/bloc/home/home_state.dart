part of 'home_bloc.dart';

abstract class HomeState {}

final class InitialProductsState extends HomeState {}

final class LoadingProductsState extends HomeState {}

final class LoadedProductsState extends HomeState {
  final List<Product> products;

  LoadedProductsState({
    required this.products,
  });
}

final class ErrorProductsState extends HomeState {
  final String error;

  ErrorProductsState({
    required this.error,
  });
}

final class NoInternetConnectionState extends HomeState {
  final String noInternetConnection = ConnectionConstants.connectionNotExists;
}
