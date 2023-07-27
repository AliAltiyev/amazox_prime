part of 'settings_bloc.dart';

final class FontSizeState extends Equatable {
  final FontSizeEntity fontSize;

  const FontSizeState({
    required this.fontSize,
  });

  @override
  List<Object?> get props => [
        fontSize,
      ];

  FontSizeState copyWith({
    FontSizeEntity? fontSize,
  }) {
    return FontSizeState(
      fontSize: fontSize ?? this.fontSize,
    );
  }
}
