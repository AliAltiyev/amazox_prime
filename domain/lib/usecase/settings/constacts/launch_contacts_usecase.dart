import 'package:domain/domain.dart';

final class LaunchContactsUseCase {
  final ConstactsRepository _contactsRepository;

  const LaunchContactsUseCase(
    ConstactsRepository constactsRepository,
  ) : _contactsRepository = constactsRepository;

  Future<void> call() async {
    await _contactsRepository.launchUrl();
  }
}
