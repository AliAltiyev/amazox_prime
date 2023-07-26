import 'package:settings/settings.dart';

class SettingsListTile extends StatelessWidget {
  final Widget _trailing;
  final Widget _leading;
  final VoidCallback _onTap;
  final String _title;

  const SettingsListTile({
    super.key,
    required Widget trailing,
    required Widget leading,
    required VoidCallback onTap,
    required String title,
  })  : _trailing = trailing,
        _leading = leading,
        _onTap = onTap,
        _title = title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _onTap,
      trailing: _trailing,
      title: Text(
        _title,
      ),
      leading: _leading,
    );
  }
}
