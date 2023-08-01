import 'package:login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Center(
        child: isSmallScreen
            ? const SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Logo(),
                    FormContent(),
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.all(
                  Dimensions.SIZE_10,
                ),
                constraints: const BoxConstraints(
                  maxWidth: 800,
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Logo(),
                    ),
                    Expanded(
                      child: Center(
                        child: FormContent(),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
