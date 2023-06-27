final class Failure {
  final int _errorCode;
  final String _message;

  Failure({required int errorCode, required String message})
      : _errorCode = errorCode,
        _message = message;

  @override
  String toString() {
    return 'ErrorCode: $_errorCode' 'Message: $_message';
  }
}
