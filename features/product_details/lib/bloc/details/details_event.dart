import 'package:product_details/product_details.dart';

@immutable
abstract class DetailsEvent {}

final class FetchProductEvent extends DetailsEvent {
  final int productId;

  FetchProductEvent({
    required this.productId,
  });
}
