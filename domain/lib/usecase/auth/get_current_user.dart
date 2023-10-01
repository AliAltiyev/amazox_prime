import 'package:domain/domain.dart';

final class GetCurrentUserUseCase {
  final AuthRepository authRepository;

  GetCurrentUserUseCase({
    required this.authRepository,
  });

  Stream<UserEntity> call() => authRepository.getCurrentUser();
}
