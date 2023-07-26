import 'package:data/data.dart';

final class UrlLauncherImpl extends UrlLauncher {
  @override
  Future<void> luanch() async {
    final Uri url = Uri.parse(ApiConstants.contactsUrl);

    if (!await launchUrl(
      url,
      mode: LaunchMode.platformDefault,
    )) {
      throw UrlLauncherException(
        "${StringConstants.urlLauncherException} $url",
      );
    }
  }
}
