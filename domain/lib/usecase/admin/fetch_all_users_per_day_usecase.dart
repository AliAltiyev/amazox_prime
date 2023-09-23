import 'package:domain/domain.dart';

final class FetchAllUsersPerDayUseCase {
  final AdminRepository _adminRepository;

  const FetchAllUsersPerDayUseCase({
    required AdminRepository adminRepository,
  }) : _adminRepository = adminRepository;

  Future<List<int>> call() async {
    return await _adminRepository.getUsersPerDay();
  }
}
