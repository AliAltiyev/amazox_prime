import 'package:data/data.dart';

final class ConnectionRepositoryImpl extends ConnectionRepository {
  final Connection _connection;

  ConnectionRepositoryImpl({
    required Connection connection,
  }) : _connection = connection;

  @override
  Future<bool> isConnected() {
    return _connection.isConnected();
  }
}
