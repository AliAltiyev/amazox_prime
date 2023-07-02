import '../home.dart';

final getIt = GetIt.instance;

Future<void> initHome() async {
  getIt.registerLazySingleton<HomeBloc>(
    () => HomeBloc(
      getIt(),
    ),
  );
}
