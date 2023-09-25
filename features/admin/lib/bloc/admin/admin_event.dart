part of 'admin_bloc.dart';

@immutable
sealed class AdminEvent {}

final class PickImageFromGalleryEvent extends AdminEvent {}

final class SaveProductEvent extends AdminEvent {
  final Product product;

  SaveProductEvent({required this.product});
}
