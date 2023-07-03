final class AppFireBaseException implements Exception {
  final String _message;

  AppFireBaseException(
    String message,
  ) : _message = message;

  @override
  String toString() {
    super.toString();
    return '{$_message}';
  }
}
