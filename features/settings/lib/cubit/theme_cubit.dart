import 'package:settings/settings.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool _isDark = false;
  bool _iconState = false;

  bool get isDark => _isDark;
  bool get iconState => _iconState;

  void changeTheme() {
    _isDark = !_isDark;
    emit(ThemeChanged());
  }

  void changeIcon() {
    _iconState = !_iconState;
  }
}
