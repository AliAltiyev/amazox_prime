import 'package:domain/domain.dart';
import 'package:domain/repository/auth/auth_repository.dart';

class UpdateUserUseCase
    extends FutureUsecaseWithParams<void, UpdateUserParams> {
  final AuthRepository _repository;

  const UpdateUserUseCase(
    AuthRepository repository,
  ) : _repository = repository;

  @override
  ResultFuture<void> call(UpdateUserParams params) => _repository.updateUser(
        action: params.action,
        userData: params.userData,
      );
}

class UpdateUserParams extends Equatable {
  const UpdateUserParams({
    required this.action,
    required this.userData,
  });

  const UpdateUserParams.empty()
      : this(
          action: UpdateUserAction.displayName,
          userData: '',
        );

  final UpdateUserAction action;
  final dynamic userData;

  @override
  List<dynamic> get props => [
        action,
        userData,
      ];
}
