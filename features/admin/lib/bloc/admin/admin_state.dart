part of 'admin_bloc.dart';

@immutable
sealed class AdminState {}

final class AdminInitial extends AdminState {}

final class ImagePickedFromGalleryState extends AdminState {
  final String imageFromGallery;

  ImagePickedFromGalleryState({
    required this.imageFromGallery,
  });
}

final class SavedProductState extends AdminState {}

final class AdminFailedState extends AdminState {
  final String errorMessage;

  AdminFailedState({required this.errorMessage});
}
