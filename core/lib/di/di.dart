import '../core.dart'; //

final instance = GetIt.instance;

Future<void> initAppModule() async {
  //FireStore
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  instance.registerLazySingleton<FirebaseFirestore>(
    () => fireStore,
  );

  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSource(),
  );

  //Repository
  instance.registerLazySingleton<RepositoryImpl>(() => RepositoryImpl(
        instance(),
      ));

  instance.registerLazySingleton<ProductRepository>(() => RepositoryImpl(
        instance(),
      ));

  instance
      .registerLazySingleton<FetchProductsUseCase>(() => FetchProductsUseCase(
            repository: instance(),
          ));

  instance.registerLazySingleton<HomeBloc>(() => HomeBloc(
        instance(),
      ));
}
