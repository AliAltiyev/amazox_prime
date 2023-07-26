import '../core.dart';

final getIt = GetIt.instance;

Future<void> initAppModule() async {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  getIt.registerLazySingleton<FirebaseFirestore>(() => fireStore);
  getIt.registerLazySingleton<UrlLauncher>(
    () => UrlLauncher(),
  );
  getIt.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  getIt.registerLazySingleton<Connection>(
      () => Connection(connection: getIt<InternetConnectionChecker>()));
}
