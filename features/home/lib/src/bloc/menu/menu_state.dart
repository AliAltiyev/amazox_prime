part of 'menu_bloc.dart';

final class MenuState {
  List<Menu> menu;
  bool isMenuAnimated;

  MenuState({
    required this.menu,
    this.isMenuAnimated = false,
  });

  MenuState copyWith({
    List<Menu>? menu,
    bool? isMenuAnimated,
  }) {
    return MenuState(
      menu: menu ?? this.menu,
      isMenuAnimated: isMenuAnimated ?? this.isMenuAnimated,
    );
  }
}
