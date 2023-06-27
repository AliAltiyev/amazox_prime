import 'package:data/mapper/product.dart';
import 'package:data/model/product.dart';
import 'package:domain/entity/product.dart';
import 'package:domain/repository/repository.dart';

import '../datasource/remote/remote_data_sourse.dart';

final class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(RemoteDataSource remoteDataSource)
      : _remoteDataSource = remoteDataSource;

  @override
  Future<List<Product>> getProducts() async {
    final List<ProductModel> data = await _remoteDataSource.getCoffees();
    return data
        .map((model) => ProductMapper.toEntity(model))
        .toList()
        .cast<Product>();
  }
}
