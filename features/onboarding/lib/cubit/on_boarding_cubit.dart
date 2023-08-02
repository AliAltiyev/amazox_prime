import 'package:onboarding/onboarding.dart';

class OnBoardingCubit extends Cubit<bool> {
  final CacheFirstTimerUseCase _cacheFirstTimerUseCase;
  final CheckIfUserIsFirstTimerUseCase _checkIfUserIsFirstTimerUseCase;

  OnBoardingCubit({
    required CacheFirstTimerUseCase cacheFirstTimer,
    required CheckIfUserIsFirstTimerUseCase checkIfUserIsFirstTimer,
  })  : _cacheFirstTimerUseCase = cacheFirstTimer,
        _checkIfUserIsFirstTimerUseCase = checkIfUserIsFirstTimer,
        super(true);

  Future<void> cacheFirstTimer() async {
    final result = await _cacheFirstTimerUseCase();

    result.fold(
      (failure) => null,
      (_) => null,
    );
  }

  Future<void> checkIfUserIsFirstTimer() async {
    final result = await _checkIfUserIsFirstTimerUseCase();

    result.fold(
      (failure) => null,
      emit,
    );
  }

  void navigateToMain() {}
}
