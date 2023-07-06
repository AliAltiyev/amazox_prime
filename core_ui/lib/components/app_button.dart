import 'package:core_ui/core_ui.dart';

class AddToCardButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const AddToCardButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //TODO add to card
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ApplicationColors.primaryButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            ApplicationPadding.PADDING_20,
          ),
        ),
        elevation: ApplicationSize.SIZE_8,
        shadowColor: ApplicationColors.black,
      ),
      child: Text(
        text,
        style: AppFonts.normal18.copyWith(
          color: ApplicationColors.black,
        ),
      ),
    );
  }
}
