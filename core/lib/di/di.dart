import 'package:core/core.dart';

final GetIt getIt = GetIt.instance;

Future<void> initAppModule() async {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  getIt.registerLazySingleton<FirebaseFirestore>(() => fireStore);
  getIt.registerLazySingleton<UrlLauncher>(
    UrlLauncher.new,
  );
  getIt.registerLazySingleton<InternetConnectionChecker>(
      InternetConnectionChecker.new);

  getIt.registerLazySingleton<Connection>(
    () => Connection(connection: getIt<InternetConnectionChecker>()),
  );
}
