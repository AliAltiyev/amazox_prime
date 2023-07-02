import '../core.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  //FireStore
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  instance.registerLazySingleton<FirebaseFirestore>(
    () => fireStore,
  );
}
