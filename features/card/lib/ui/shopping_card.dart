import 'package:card/shopping_card.dart';

class ShappingCard extends StatefulWidget {
  const ShappingCard({super.key});

  @override
  State<ShappingCard> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<ShappingCard> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Shopping Card',
      ),
    );
  }
}
