import 'package:domain/domain.dart';

final class FetchAllUserByRegistrationDateUseCase {
  final AdminRepository _adminRepository;

  const FetchAllUserByRegistrationDateUseCase({
    required AdminRepository adminRepository,
  }) : _adminRepository = adminRepository;

  Future<List<UserEntity>> call() async {
    return await _adminRepository.getUsersByRegistrationDate();
  }
}
