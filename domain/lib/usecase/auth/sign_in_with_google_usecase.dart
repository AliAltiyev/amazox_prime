import 'package:domain/domain.dart';

class SigninWithGoogleUseCase
    extends FutureUsecaseWithParams<UserEntity, SignInWithGoogleParams> {
  final AuthRepository _repository;

  const SigninWithGoogleUseCase(
    AuthRepository repository,
  ) : _repository = repository;

  @override
  ResultFuture<UserEntity> call(SignInWithGoogleParams params) =>
      _repository.signInWithGoogle();
}

class SignInWithGoogleParams extends Equatable {
  const SignInWithGoogleParams();

  @override
  List<String> get props => [];
}
