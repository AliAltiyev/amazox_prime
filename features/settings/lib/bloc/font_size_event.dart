part of 'font_size_bloc.dart';

abstract class FontSizeEvent extends Equatable {}

final class SaveFontSizeEvent extends FontSizeEvent {
  final FontSizeEntity fontSizeEntity;

  SaveFontSizeEvent({
    required this.fontSizeEntity,
  });

  @override
  List<Object?> get props => [
        fontSizeEntity,
      ];
}

final class GetFontSizeEvent extends FontSizeEvent {
  @override
  List<Object?> get props => [];
}
