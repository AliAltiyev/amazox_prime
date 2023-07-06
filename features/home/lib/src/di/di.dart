import '../home.dart';

void initHome() async {
  getIt.registerLazySingleton<HomeBloc>(
    () => HomeBloc(
      getIt(),
    ),
  );
}
