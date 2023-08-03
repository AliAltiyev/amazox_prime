import 'package:domain/domain.dart';

class LogOutUseCase extends FutureUsecaseWithParams<void, LogOutUseCaseParams> {
  final AuthRepository _repository;

  const LogOutUseCase(
    AuthRepository repository,
  ) : _repository = repository;
  @override
  ResultFuture<void> call(params) => _repository.logOut();
}

class LogOutUseCaseParams extends Equatable {
  @override
  List<String> get props => [];
}
