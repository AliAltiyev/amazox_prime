import 'package:core/core.dart';

class CacheException extends Equatable implements Exception {
  const CacheException({
    required this.message,
    this.statusCode = 500,
  });

  final String message;
  final int statusCode;

  @override
  List<dynamic> get props => [
        message,
        statusCode,
      ];
}
