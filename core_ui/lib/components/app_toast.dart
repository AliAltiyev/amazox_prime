import 'package:core_ui/core_ui.dart';

abstract class AppToast {
  static Future<bool?> showToast() {
    return Fluttertoast.showToast(
      msg: ConnectionConstants.connectionNotExists,
      backgroundColor: ApplicationColors.red,
      fontSize: FontSize.s18,
      gravity: ToastGravity.TOP,
      textColor: ApplicationColors.white,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
