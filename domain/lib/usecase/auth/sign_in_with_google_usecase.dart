import 'package:domain/domain.dart';

class SignInWithGoogleUseCase
    extends FutureUseCaseWithParams<UserEntity, SignInWithGoogleParams> {
  final AuthRepository _repository;

  const SignInWithGoogleUseCase(
    AuthRepository repository,
  ) : _repository = repository;

  @override
  ResultFuture<UserEntity> call(SignInWithGoogleParams params) =>
      _repository.signInWithGoogle();
}

class SignInWithGoogleParams extends Equatable {
  const SignInWithGoogleParams();

  @override
  List<String> get props => <String>[];
}
