import 'package:domain/domain.dart';

class SignUpUseCase extends FutureUsecaseWithParams<void, SignUpParams> {
  final AuthRepository _repository;

  const SignUpUseCase(
    AuthRepository repository,
  ) : _repository = repository;

  @override
  ResultFuture<void> call(SignUpParams params) => _repository.signUp(
        email: params.email,
        password: params.password,
        fullName: params.fullName,
      );
}

class SignUpParams extends Equatable {
  final String email;
  final String password;
  final String fullName;

  const SignUpParams({
    required this.email,
    required this.password,
    required this.fullName,
  });

  const SignUpParams.empty()
      : this(
          email: '',
          password: '',
          fullName: '',
        );

  @override
  List<String> get props => [
        email,
        password,
        fullName,
      ];
}
