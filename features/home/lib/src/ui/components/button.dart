import 'package:home/src/home.dart';

class AddToCardButton extends StatelessWidget {
  final Function onPressed;

  const AddToCardButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        return;
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
        StringConstant.addToCard,
        style: AppFonts.normal18.copyWith(
          color: ApplicationColors.black,
        ),
      ),
    );
  }
}
