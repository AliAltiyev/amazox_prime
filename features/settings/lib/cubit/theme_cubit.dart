import 'package:settings/settings.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SaveAppThemeUseCase _saveAppThemeUseCase;
  final GetAppThemeUseCase _getAppThemeUseCase;
  bool _isDark = false;
  bool _iconState = false;
  bool get isDark => _isDark;
  bool get iconState => _iconState;

  ThemeCubit({
    required SaveAppThemeUseCase saveAppThemeUseCase,
    required GetAppThemeUseCase getAppThemeUseCase,
  })  : _saveAppThemeUseCase = saveAppThemeUseCase,
        _getAppThemeUseCase = getAppThemeUseCase,
        super(ThemeInitial()) {
    _isDark = false;
    getTheme();
  }

  set isDark(bool value) {
    _isDark = value;
    _saveAppThemeUseCase.call(value);
    emit(ThemeChanged());
  }

  Future<void> getTheme() async {
    _isDark = await _getAppThemeUseCase.call(LocaleStorage.key.name);
    emit(ThemeChanged());
  }

  void changeIcon() {
    isDark = !isDark;
    _iconState = !_iconState;
  }
}
