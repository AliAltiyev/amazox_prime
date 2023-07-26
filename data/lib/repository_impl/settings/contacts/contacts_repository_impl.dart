import 'package:data/data.dart';

final class ContactsRepositoryImpl extends ConstactsRepository {
  final UrlLauncher _urlLauncher;

  ContactsRepositoryImpl(
    UrlLauncher urlLauncher,
  ) : _urlLauncher = urlLauncher;

  @override
  Future<void> launchUrl() async {
    await _urlLauncher.luanch();
  }
}
