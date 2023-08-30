import 'package:domain/usecase/get_menu.dart';
import 'package:home/src/home.dart';

part 'menu_event.dart';
part 'menu_state.dart';

final class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final FetchMenuItemsUseCase _fetchMenuItemsUseCase;

  MenuBloc({
    required FetchMenuItemsUseCase fetchMenuItemsUseCase,
  })  : _fetchMenuItemsUseCase = fetchMenuItemsUseCase,
        super(MenuState(menu: <Menu>[])) {
    on<FetchMenuEvent>(_onFetchMenuEvent);
    on<ChangeMenuItemSizeEvent>(onChangeMenuItemSize);

    add(FetchMenuEvent());
  }

  Future<void> _onFetchMenuEvent(
    FetchMenuEvent event,
    Emitter<MenuState> emit,
  ) async {
    try {
      final List<Menu> data = await _fetchMenuItemsUseCase();
      emit(MenuState(
        menu: data,
      ));
    } catch (e) {
      throw (Exception());
    }
  }

  Future<void> onChangeMenuItemSize(
    ChangeMenuItemSizeEvent event,
    Emitter<MenuState> emit,
  ) async {
    emit(MenuState(
      menu: await _fetchMenuItemsUseCase(),
      isMenuAnimated: changeIsAnimatedState(),
    ));
  }

  bool changeIsAnimatedState() => state.isMenuAnimated = !state.isMenuAnimated;
}
