import 'package:settings/settings.dart';

void initSettingsBloc() {
  getIt.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(
      getAppThemeUseCase: getIt(),
      saveAppThemeUseCase: getIt(),
    ),
  );
}
