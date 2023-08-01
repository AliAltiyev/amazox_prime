import 'package:core_ui/core_ui.dart';

class AppAuthButton extends StatelessWidget {
  final String text;
  final GlobalKey<FormState>? formKey;
  final bool isSignUp;
  const AppAuthButton({
    required this.text,
    required this.isSignUp,
    this.formKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: isSignUp
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(
                Dimensions.SIZE_16,
              ),
              color: isSignUp
                  ? ApplicationColors.white
                  : ApplicationColors.primaryButtonColor,
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(
                Dimensions.SIZE_16,
              ),
              color: ApplicationColors.white,
            ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(
            Dimensions.SIZE_0,
          ),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(
            const EdgeInsets.only(
              right: Dimensions.SIZE_75,
              left: Dimensions.SIZE_75,
              top: Dimensions.SIZE_16,
              bottom: Dimensions.SIZE_16,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
          shape: isSignUp
              ? MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Dimensions.SIZE_16,
                    ),
                  ),
                )
              : MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: const BorderSide(
                      width: Dimensions.SIZE_2,
                      color: ApplicationColors.primaryButtonColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      Dimensions.SIZE_16,
                    ),
                  ),
                ),
        ),
        onPressed: () {
          if (formKey?.currentState?.validate() ?? false) {
            /// do something
          }
        },
        child: Text(
          text,
          style: AppFonts.bold16.copyWith(
            color: !isSignUp
                ? ApplicationColors.primaryButtonColor
                : ApplicationColors.white,
          ),
        ),
      ),
    );
  }
}
