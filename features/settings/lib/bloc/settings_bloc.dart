import 'dart:async';

import 'package:navigation/navigation/app_router.dart';
import 'package:settings/settings.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, FontSizeState> {
  final SaveFontSizeUsecase _saveFontSizeUsecase;
  final GetFontSizeUsecase _getFontSizeUsecase;
  final UrlLauncher _urlLauncher;
  final LogOutUseCase _logOutUseCase;
  final AppRouter _appRouter;

  SettingsBloc(
      {required SaveFontSizeUsecase saveFontSizeUsecase,
      required GetFontSizeUsecase getFontSizeUsecase,
      required UrlLauncher urlLauncher,
      required AppRouter appRouter,
      required logOutUseCase})
      : _saveFontSizeUsecase = saveFontSizeUsecase,
        _getFontSizeUsecase = getFontSizeUsecase,
        _urlLauncher = urlLauncher,
        _logOutUseCase = logOutUseCase,
        _appRouter = appRouter,
        super(FontSizeState(fontSize: FontSizeEntity())) {
    on<SaveFontSizeEvent>(_changeFontSize);
    on<GetFontSizeEvent>(_getFontSize);
    on<LaunchContactsEvent>(_launchContacts);
    on<SignOutFromAppEvent>(_singOutHandler);
  }

  Future<void> _changeFontSize(
    SaveFontSizeEvent event,
    Emitter<FontSizeState> emit,
  ) async {
    await _saveFontSizeUsecase.call(
      fontsize: event.fontSizeEntity,
    );
    emit(
      state.copyWith(fontSize: event.fontSizeEntity),
    );
  }

  Future<void> _getFontSize(
    GetFontSizeEvent event,
    Emitter<FontSizeState> emit,
  ) async {
    final FontSizeEntity fontSize = _getFontSizeUsecase();

    emit(
      state.copyWith(fontSize: fontSize),
    );
  }

  Future<void> _launchContacts(
    LaunchContactsEvent event,
    Emitter<FontSizeState> emit,
  ) async {
    await _urlLauncher.launch(ApiConstants.contactsUrl);
  }

  Future<void> _singOutHandler(
    SignOutFromAppEvent event,
    Emitter<FontSizeState> emit,
  ) async {
    await _logOutUseCase.call(LogOutUseCaseParams());
    await _appRouter.replace(const SignInPage());
  }
}
