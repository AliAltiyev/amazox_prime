import 'package:core_ui/core_ui.dart';

class PrimaryAppButton extends StatelessWidget {
  final IconData _icon;
  final VoidCallback _onPress;
  const PrimaryAppButton({
    required IconData icon,
    required VoidCallback onPress,
    super.key,
  })  : _icon = icon,
        _onPress = onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        ApplicationPadding.PADDING_12,
      ),
      child: GestureDetector(
        onTap: _onPress,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Dimensions.SIZE_20,
              ),
            ),
            color: ApplicationColors.primaryButtonColor,
          ),
          child: Icon(
            _icon,
            size: Dimensions.SIZE_20,
          ),
        ),
      ),
    );
  }
}
