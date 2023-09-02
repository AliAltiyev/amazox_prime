import 'dart:async';

import 'package:navigation/navigation/app_router.dart';
import 'package:settings/settings.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, FontSizeState> {
  final SaveFontSizeUseCase _saveFontSizeUseCase;
  final GetFontSizeUseCase _getFontSizeUseCase;
  final UrlLauncher _urlLauncher;
  final LogOutUseCase _logOutUseCase;
  final AppRouter _appRouter;

  SettingsBloc({
    required SaveFontSizeUseCase saveFontSizeUseCase,
    required GetFontSizeUseCase getFontSizeUseCase,
    required UrlLauncher urlLauncher,
    required AppRouter appRouter,
    required logOutUseCase,
  })  : _saveFontSizeUseCase = saveFontSizeUseCase,
        _getFontSizeUseCase = getFontSizeUseCase,
        _urlLauncher = urlLauncher,
        _logOutUseCase = logOutUseCase,
        _appRouter = appRouter,
        super(FontSizeState(fontSize: FontSizeEntity())) {
    on<SaveFontSizeEvent>(_onChangeFontSize);
    on<GetFontSizeEvent>(_onGetFontSize);
    on<LaunchContactsEvent>(_onLaunchContacts);
    on<SignOutFromAppEvent>(_onSignOut);
    on<PopEvent>(_onPop);
  }

  Future<void> _onChangeFontSize(
    SaveFontSizeEvent event,
    Emitter<FontSizeState> emit,
  ) async {
    await _saveFontSizeUseCase.call(
      fontSize: event.fontSizeEntity,
    );
    emit(
      state.copyWith(fontSize: event.fontSizeEntity),
    );
  }

  Future<void> _onGetFontSize(
    GetFontSizeEvent event,
    Emitter<FontSizeState> emit,
  ) async {
    final FontSizeEntity fontSize = _getFontSizeUseCase();

    emit(
      state.copyWith(fontSize: fontSize),
    );
  }

  Future<void> _onLaunchContacts(
    LaunchContactsEvent event,
    Emitter<FontSizeState> emit,
  ) async {
    await _urlLauncher.launch(ApiConstants.contactsUrl);
  }

  Future<void> _onSignOut(
    SignOutFromAppEvent event,
    Emitter<FontSizeState> emit,
  ) async {
    await _logOutUseCase(LogOutUseCaseParams());
    await _appRouter.replace(const SignInPage());
  }

  Future<void> _onPop(
    PopEvent event,
    Emitter<FontSizeState> emit,
  ) async {
    await _appRouter.pop<Object>();
  }
}
