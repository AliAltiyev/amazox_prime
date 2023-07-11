import 'package:amazon_prime/app.dart';

class Application extends StatelessWidget {
  Application({super.key});

  final AppRouter appRouter = getIt.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(
        getAppThemeUseCase: getIt<GetAppThemeUseCase>(),
        saveAppThemeUseCase: getIt<SaveAppThemeUseCase>(),
      ),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(
    BuildContext context,
    ThemeState state,
  ) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeCubit(
        getAppThemeUseCase: getIt<GetAppThemeUseCase>(),
        saveAppThemeUseCase: getIt<SaveAppThemeUseCase>(),
      ).isDark
          ? DarkTheme.instance.darkTheme
          : LightTheme.instance.lightTheme,
      routerDelegate: AutoRouterDelegate(appRouter),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
