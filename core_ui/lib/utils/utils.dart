import 'package:core_ui/core_ui.dart';

class Utils {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: AppFonts.bold14,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: ApplicationColors.primaryButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.SIZE_10,
            ),
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: Dimensions.SIZE_10,
            vertical: Dimensions.SIZE_10,
          ),
        ),
      );
  }
}
