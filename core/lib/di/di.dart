import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/datasource/remote/remote_data_sourse.dart';
import 'package:data/repository_impl/repository_impl.dart';
import 'package:domain/repository/repository.dart';
import 'package:domain/usecase/get_products.dart';
import 'package:get_it/get_it.dart';
import 'package:home/src/bloc/home_bloc.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  //FireStore
  final fireStore = FirebaseFirestore.instance;
  instance.registerLazySingleton<FirebaseFirestore>(() => fireStore);

  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());

  //Repository

  instance
      .registerLazySingleton<RepositoryImpl>(() => RepositoryImpl(instance()));

  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance()));

  instance.registerLazySingleton<GetProductsUseCase>(
      () => GetProductsUseCase(repository: instance()));

  instance.registerLazySingleton<HomeBloc>(() => HomeBloc(instance()));
}
