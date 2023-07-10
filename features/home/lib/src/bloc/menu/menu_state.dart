part of 'menu_bloc.dart';

abstract class MenuState {}

final class InitialMenuState extends MenuState {}

final class LoadingMenuUState extends MenuState {}

final class LoadedMenuState extends MenuState {
  List<Menu> menu;

  LoadedMenuState({
    required this.menu,
  });
}

final class FailedFetchMenuState extends MenuState {
  final String error;

  FailedFetchMenuState({
    required this.error,
  });
}
