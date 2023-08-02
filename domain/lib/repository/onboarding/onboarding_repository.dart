import 'package:domain/domain.dart';

abstract class OnBoardingRepository {
  ResultFuture<void> cacheFirstTimer();

  ResultFuture<bool> checkIfUserIsFirstTimer();
}
