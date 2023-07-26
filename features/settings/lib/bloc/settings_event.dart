part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {}

final class SaveFontSizeEvent extends SettingsEvent {
  final FontSizeEntity fontSizeEntity;

  SaveFontSizeEvent({
    required this.fontSizeEntity,
  });

  @override
  List<Object?> get props => [
        fontSizeEntity,
      ];
}

final class GetFontSizeEvent extends SettingsEvent {
  @override
  List<Object?> get props => [];
}

final class LaunchContactsEvent extends SettingsEvent {
  @override
  List<Object?> get props => [];
}
