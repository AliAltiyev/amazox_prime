import 'package:domain/domain.dart';

final class ConnectionUseCase {
  final ConnectionRepository _connectionRepository;

  ConnectionUseCase({
    required ConnectionRepository connectionRepository,
  }) : _connectionRepository = connectionRepository;

  Future<bool> call() async {
    return _connectionRepository.isConnected();
  }
}
