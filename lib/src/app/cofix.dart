import 'package:amazon_prime/app.dart';

class Application extends StatelessWidget {
  Application({super.key});

  final AppRouter appRouter = getIt.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<ThemeCubit>(
          create: (context) => getIt<ThemeCubit>(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(
            addCartItemUseCase: getIt<AddCartItemUseCase>(),
            getAllCartItemsUseCase: getIt<GetAllCartItemsUseCase>(),
            removeCartItemUseCase: getIt<RemoveCartItemUseCase>(),
            removeAllCartItemsUseCase: getIt<RemoveAllCartItemsUseCase>(),
          )..add(LoadCart()),
        ),
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(
            appRouter: getIt<AppRouter>(),
            logOutUseCase: getIt<LogOutUseCase>(),
            urlLauncher: getIt<UrlLauncher>(),
            getFontSizeUsecase: getIt<GetFontSizeUsecase>(),
            saveFontSizeUsecase: getIt<SaveFontSizeUsecase>(),
          )..add(
              GetFontSizeEvent(),
            ),
        ),
        BlocProvider<OnBoardingCubit>(
          create: (context) => OnBoardingCubit(
            cacheFirstTimer: getIt<CacheFirstTimerUseCase>(),
            checkIfUserIsFirstTimer: getIt<CheckIfUserIsFirstTimerUseCase>(),
          ),
          child: Provider(
            create: (context) => ChangeNotifierProvider(
              create: (context) => UserProvider(),
            ),
          ),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            signinWithGoogleUseCase: getIt<SigninWithGoogleUseCase>(),
            autoRouter: getIt<AppRouter>(),
            signInUseCase: getIt<SignInUseCase>(),
            signUpUseCase: getIt<SignUpUseCase>(),
            forgotPasswordUseCase: getIt<ForgotPasswordUseCase>(),
          ),
        )
      ],
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
      builder: (context, child) {
        return MediaQuery(
          data: context.mediaQuery.copyWith(
            textScaleFactor:
                context.watch<SettingsBloc>().state.fontSize.fontSize,
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
      debugShowCheckedModeBanner: false,
      theme: getIt<ThemeCubit>().isDark
          ? DarkTheme.instance.darkTheme
          : LightTheme.instance.lightTheme,
      routerDelegate: AutoRouterDelegate(appRouter),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
