part of 'font_size_bloc.dart';

final class FontSizeState extends Equatable {
  final FontSizeEntity fontSize;

  const FontSizeState({
    required this.fontSize,
  });

  @override
  List<Object?> get props => [
        fontSize,
      ];
}
