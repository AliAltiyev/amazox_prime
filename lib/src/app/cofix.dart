import 'package:amazon_prime/index.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: const HomeView(),
    );
  }
}
