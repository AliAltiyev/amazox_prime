import '../core.dart';

final getIt = GetIt.instance;

Future<void> initAppModule() async {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => fireStore,
  );
}
