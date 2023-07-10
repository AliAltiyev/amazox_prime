import '../home.dart';

final getIt = GetIt.instance;

Future<void> initHome() async {
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
