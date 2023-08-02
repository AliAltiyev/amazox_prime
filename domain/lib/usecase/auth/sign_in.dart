import 'package:domain/domain.dart';
import 'package:domain/repository/auth/auth_repository.dart';

class SignInUseCase extends FutureUsecaseWithParams<UserEntity, SignInParams> {
  final AuthRepository _repository;

  const SignInUseCase(
    AuthRepository repository,
  ) : _repository = repository;

  @override
  ResultFuture<UserEntity> call(SignInParams params) => _repository.signIn(
        email: params.email,
        password: params.password,
      );
}

class SignInParams extends Equatable {
  const SignInParams({
    required this.email,
    required this.password,
  });

  const SignInParams.empty()
      : email = '',
        password = '';

  final String email;
  final String password;

  @override
  List<String> get props => [
        email,
        password,
      ];
}
