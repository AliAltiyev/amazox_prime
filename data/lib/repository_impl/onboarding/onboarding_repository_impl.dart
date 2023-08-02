import 'package:core/exceptions/cache.dart';
import 'package:data/data.dart';

export 'package:data/data.dart';

class OnBoardingRepositoryImpl implements OnBoardingRepository {
  final LocaleDataSource _localeDataSource;

  const OnBoardingRepositoryImpl(
    this._localeDataSource,
  );

  @override
  ResultFuture<void> cacheFirstTimer() async {
    try {
      await _localeDataSource.cacheFirstTimer();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<bool> checkIfUserIsFirstTimer() async {
    try {
      final result = await _localeDataSource.checkIfUserIsFirstTimer();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    }
  }
}
