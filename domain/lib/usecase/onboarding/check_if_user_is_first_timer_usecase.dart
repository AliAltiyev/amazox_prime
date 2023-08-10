import 'package:domain/domain.dart';

class CheckIfUserIsFirstTimerUseCase extends FutureUsecaseWithoutParams<bool> {
  final OnBoardingRepository _repository;

  const CheckIfUserIsFirstTimerUseCase({
    required OnBoardingRepository repository,
  }) : _repository = repository;

  @override
  ResultFuture<bool> call() async => _repository.checkIfUserIsFirstTimer();
}
