final class CustomFireBaseException implements Exception {
  final String _message;

  CustomFireBaseException(
    String message,
  ) : _message = message;

  @override
  String toString() {
    super.toString();
    return '{$_message}';
  }
}
