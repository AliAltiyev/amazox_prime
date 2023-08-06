import 'package:settings/settings.dart';

class PopupItem extends StatelessWidget {

  final String title;
  final Widget icon;

  const PopupItem({
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: AppFonts.bold14,
        ),
        icon,
      ],
    );
  }
}
