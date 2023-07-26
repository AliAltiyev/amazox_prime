import 'package:core/core.dart';

final class UrlLauncher {
  Future<void> launch(String url) async {
    try {
      final Uri uri = Uri.parse(url);

      if (!await launchUrl(
        uri,
        mode: LaunchMode.platformDefault,
      )) {
        throw UrlLauncherException(
          "${StringConstants.urlLauncherException} $url",
        );
      }
    } catch (_) {}
  }
}
