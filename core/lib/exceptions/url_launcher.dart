final class UrlLauncherException implements Exception {
  final String message;

  const UrlLauncherException(
    this.message,
  );

  @override
  String toString() {
    return message;
  }
}
