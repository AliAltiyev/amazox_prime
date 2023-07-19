import 'package:data/data.dart';

final class ConnectionImpl extends Connection {
  final InternetConnectionChecker _connection;

  ConnectionImpl({
    required InternetConnectionChecker connection,
  }) : _connection = connection;

  @override
  Future<bool> isConnected() async => await _connection.hasConnection;
}
