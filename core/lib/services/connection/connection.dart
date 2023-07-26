import 'package:core/core.dart';

final class Connection {
  final InternetConnectionChecker _connection;

  Connection({
    required InternetConnectionChecker connection,
  }) : _connection = connection;

  Future<bool> isConnected() async => await _connection.hasConnection;
}
