part of 'menu_bloc.dart';

@immutable
abstract class MenuEvent {}

final class FetchMenuEvent extends MenuEvent {}

final class ChangeMenuItemSizeEvent extends MenuEvent {}
