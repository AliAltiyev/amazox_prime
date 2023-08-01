import 'package:core_ui/core_ui.dart';

class AppGoogleButton extends StatelessWidget {
  final Function() onPressed;
  const AppGoogleButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
        height: size.height / Dimensions.SIZE_20,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)))),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/google.json'),
              const SizedBox(
                width: 10,
              ),
              const Text("Google",
                  style: TextStyle(color: Colors.black, fontSize: 16)),
            ],
          ),
        ));
  }
}
