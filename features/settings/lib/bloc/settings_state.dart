part of 'settings_bloc.dart';

final class SettingsState extends Equatable {
  final FontSizeEntity fontSize;
  final Stream<UserEntity> currentUser;

  const SettingsState({
    required this.fontSize,
    required this.currentUser,
  });

  @override
  List<Object?> get props => <Object?>[
        fontSize,
        currentUser,
      ];

  SettingsState copyWith({
    FontSizeEntity? fontSize,
    Stream<UserEntity>? currentUser,
  }) {
    return SettingsState(
      fontSize: fontSize ?? this.fontSize,
      currentUser: currentUser ?? this.currentUser,
    );
  }
}
