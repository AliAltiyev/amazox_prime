import '../home.dart';

final getIt = GetIt.instance;

Future<void> initHome() async {
  await _initHomeBloc();
  await _initMenuBloc();
}

Future<void> _initHomeBloc() async {
  getIt.registerLazySingleton<HomeBloc>(
    () => HomeBloc(
      getIt(),
    ),
  );
}

Future<void> _initMenuBloc() async {
  getIt.registerLazySingleton<MenuBloc>(
    () => MenuBloc(
      getIt(),
    ),
  );
}
