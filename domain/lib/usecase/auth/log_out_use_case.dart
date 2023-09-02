import 'package:domain/domain.dart';

class LogOutUseCase extends FutureUseCaseWithParams<void, LogOutUseCaseParams> {
  final AuthRepository _repository;

  const LogOutUseCase(
    AuthRepository repository,
  ) : _repository = repository;
  @override
  ResultFuture<void> call(LogOutUseCaseParams params) => _repository.logOut();
}

class LogOutUseCaseParams extends Equatable {
  @override
  List<String> get props => <String>[];
}
