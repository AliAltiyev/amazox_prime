import 'package:core_ui/core_ui.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? labelColor;

  const RoundedButton({
    required this.label,
    required this.onPressed,
    this.buttonColor,
    this.labelColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? ApplicationColors.primaryButtonColor,
        foregroundColor: labelColor ?? ApplicationColors.white,
        minimumSize: const Size(
          double.maxFinite,
          Dimensions.SIZE_50,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
      ),
    );
  }
}
