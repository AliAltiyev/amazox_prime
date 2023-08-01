import 'package:login/login.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Вход',
              style: AppFonts.bold24,
            ),
            const SizedBox(
              width: 100,
            )
          ],
        ),
        Lottie.asset('assets/lottie/auth_animation.json'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Добро пожаловать в Amazox ',
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.headlineLarge
                : Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.black),
          ),
        )
      ],
    );
  }
}
