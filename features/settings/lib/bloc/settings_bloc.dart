import 'dart:async';
import 'dart:io';

import 'package:navigation/navigation/app_router.dart';
import 'package:settings/settings.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SaveFontSizeUseCase _saveFontSizeUseCase;
  final GetFontSizeUseCase _getFontSizeUseCase;
  final ChangeUserAvatarUserCase _changeUserAvatarUserCase;
  final UrlLauncher _urlLauncher;
  final LogOutUseCase _logOutUseCase;
  final AppRouter _appRouter;
  final ImagePicker _imagePicker;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  SettingsBloc({
    required SaveFontSizeUseCase saveFontSizeUseCase,
    required GetFontSizeUseCase getFontSizeUseCase,
    required GetCurrentUserUseCase getCurrentUserUseCase,
    required ChangeUserAvatarUserCase changeUserAvatarUserCase,
    required UrlLauncher urlLauncher,
    required AppRouter appRouter,
    required logOutUseCase,
    required ImagePicker imagePicker,
  })  : _saveFontSizeUseCase = saveFontSizeUseCase,
        _getCurrentUserUseCase = getCurrentUserUseCase,
        _getFontSizeUseCase = getFontSizeUseCase,
        _urlLauncher = urlLauncher,
        _changeUserAvatarUserCase = changeUserAvatarUserCase,
        _logOutUseCase = logOutUseCase,
        _appRouter = appRouter,
        _imagePicker = imagePicker,
        super(SettingsState(
          currentUser: getCurrentUserUseCase(),
          fontSize: FontSizeEntity(),
        )) {
    on<SaveFontSizeEvent>(_onChangeFontSize);
    on<GetFontSizeEvent>(_onGetFontSize);
    on<LaunchContactsEvent>(_onLaunchContacts);
    on<SignOutFromAppEvent>(_onSignOut);
    on<PopEvent>(_onPop);
    on<ChangeAvatarImage>(_onChangeAvatarImage);
  }

  Future<void> _onChangeFontSize(
    SaveFontSizeEvent event,
    Emitter<SettingsState> emit,
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
    Emitter<SettingsState> emit,
  ) async {
    final FontSizeEntity fontSize = _getFontSizeUseCase();

    emit(
      state.copyWith(fontSize: fontSize),
    );
  }

  Future<void> _onLaunchContacts(
    LaunchContactsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _urlLauncher.launch(ApiConstants.contactsUrl);
  }

  Future<void> _onSignOut(
    SignOutFromAppEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _logOutUseCase(LogOutUseCaseParams());
    await _appRouter.replace(const SignInPage());
  }

  Future<void> _onPop(
    PopEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _appRouter.pop<Object>();
  }

  Future<void> _onChangeAvatarImage(
    ChangeAvatarImage event,
    Emitter<SettingsState> emit,
  ) async {
    final pickedImage = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      requestFullMetadata: true,
    );

    if (pickedImage == null) return;
    await _changeUserAvatarUserCase(
      imageFile: File(pickedImage.path),
    );
  }
}
