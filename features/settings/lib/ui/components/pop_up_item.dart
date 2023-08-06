import 'package:settings/settings.dart';

class PopupItem extends StatelessWidget {
  const PopupItem({required this.title, required this.icon, super.key});

  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title, style: AppFonts.bold14),
        icon,
      ],
    );
  }
}
