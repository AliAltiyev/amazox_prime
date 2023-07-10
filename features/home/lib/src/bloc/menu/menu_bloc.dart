import 'package:home/src/home.dart';

part 'menu_event.dart';

part 'menu_state.dart';

final class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final FetchMenuItemsUseCase _fetchMenuItemsUseCase;

  MenuBloc(
    FetchMenuItemsUseCase fetchMenuItemsUseCase,
  )   : _fetchMenuItemsUseCase = fetchMenuItemsUseCase,
        super(
          InitialMenuState(),
        ) {
    on<FetchMenuEvent>(_fetchMenuEvent);
    add(FetchMenuEvent());
  }

  Future<void> _fetchMenuEvent(
    FetchMenuEvent event,
    Emitter<MenuState> emit,
  ) async {
    emit(
      LoadingMenuUState(),
    );
    try {
      final List<Menu> data = await _fetchMenuItemsUseCase();
      emit(LoadedMenuState(
        menu: data,
      ));
    } catch (e) {
      emit(FailedFetchMenuState(
        error: StringConstants.stateError,
      ));
    }
  }
}
