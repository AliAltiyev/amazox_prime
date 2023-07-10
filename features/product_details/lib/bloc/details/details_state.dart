import 'package:product_details/product_details.dart';

@immutable
abstract class DetailsState {}

final class InitialDetailsState extends DetailsState {}

final class LoadingDetailsState extends DetailsState {}

final class LoadedDetailsState extends DetailsState {
  final Product product;

  LoadedDetailsState({
    required this.product,
  });

  LoadedDetailsState copyWith({
    required Product product,
  }) {
    return LoadedDetailsState(
      product: product,
    );
  }
}

final class FailedDetailsState extends DetailsState {
  final String message;

  FailedDetailsState({
    required this.message,
  });
}
