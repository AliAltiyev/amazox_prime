import 'package:core/exceptions/cache.dart';
import 'package:data/data.dart';

export 'package:data/data.dart';

class OnBoardingRepositoryImpl implements OnBoardingRepository {
  final UserLocale _userLocale;

  const OnBoardingRepositoryImpl(
    this._userLocale,
  );

  @override
  ResultFuture<void> cacheFirstTimer() async {
    try {
      await _userLocale.saveUserFirstTime();
      return const Right<Failure, void>(null);
    } on CacheException catch (e) {
      return Left<Failure, UserEntity>(
        CacheFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  ResultFuture<bool> checkIfUserIsFirstTimer() async {
    try {
      final bool result = await _userLocale.checkUserIfExists();
      return Right<Failure, bool>(result);
    } on CacheException catch (e) {
      return Left<Failure, bool>(
        CacheFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }
}
