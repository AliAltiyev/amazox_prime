import 'package:core_ui/core_ui.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? buttonColour;
  final Color? labelColour;

  const RoundedButton({
    required this.label,
    required this.onPressed,
    this.buttonColour,
    this.labelColour,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColour ?? ApplicationColors.primaryButtonColor,
        foregroundColor: labelColour ?? ApplicationColors.white,
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
