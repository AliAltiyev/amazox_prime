import 'package:domain/domain.dart';

class CacheFirstTimerUseCase extends FutureUsecaseWithoutParams<void> {
  final OnBoardingRepository _repository;

  const CacheFirstTimerUseCase({
    required OnBoardingRepository repository,
  }) : _repository = repository;

  @override
  ResultFuture<void> call() async => _repository.cacheFirstTimer();
}
