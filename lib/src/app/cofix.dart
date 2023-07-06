import 'package:amazon_prime/app.dart';
import 'package:navigation/navigation/app_router.dart';

class Application extends StatelessWidget {
  Application({super.key});

  final AppRouter appRouter = getIt.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      routerDelegate: AutoRouterDelegate(appRouter),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
