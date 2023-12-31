import 'package:domain/domain.dart';

class ForgotPasswordUseCase extends FutureUseCaseWithParams<void, String> {
  final AuthRepository _repository;

  const ForgotPasswordUseCase(
    AuthRepository repository,
  ) : _repository = repository;

  @override
  ResultFuture<void> call(String params) => _repository.forgotPassword(params);
}
