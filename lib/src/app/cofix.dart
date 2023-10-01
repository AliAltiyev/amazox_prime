import 'package:amazon_prime/app.dart';

class Application extends StatelessWidget {
  Application({super.key});

  final AppRouter appRouter = getIt.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<OrderBloc>(
          create: (BuildContext context) =>
              OrderBloc(getAllUserOrders: getIt<GetAllUserOrdersUseCase>()),
        ),
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => getIt<ThemeCubit>(),
        ),
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(
            saveOrderRemoteUseCase: getIt<SaveOrderRemoteUseCase>(),
            saveUserOrderUseCase: getIt<SaveUserOrderUseCase>(),
            addCartItemUseCase: getIt<AddCartItemUseCase>(),
            getAllCartItemsUseCase: getIt<GetAllCartItemsUseCase>(),
            removeCartItemUseCase: getIt<RemoveCartItemUseCase>(),
            removeAllCartItemsUseCase: getIt<RemoveAllCartItemsUseCase>(),
          )..add(LoadCart()),
        ),
        BlocProvider<SettingsBloc>(
          create: (BuildContext context) => SettingsBloc(
            getCurrentUserUseCase: getIt<GetCurrentUserUseCase>(),
            changeUserAvatarUserCase: getIt<ChangeUserAvatarUserCase>(),
            imagePicker: getIt<ImagePicker>(),
            appRouter: getIt<AppRouter>(),
            logOutUseCase: getIt<LogOutUseCase>(),
            urlLauncher: getIt<UrlLauncher>(),
            getFontSizeUseCase: getIt<GetFontSizeUseCase>(),
            saveFontSizeUseCase: getIt<SaveFontSizeUseCase>(),
          )..add(
              GetFontSizeEvent(),
            ),
        ),
        BlocProvider<OnBoardingCubit>(
          create: (BuildContext context) => OnBoardingCubit(
            cacheFirstTimer: getIt<CacheFirstTimerUseCase>(),
            checkIfUserIsFirstTimer: getIt<CheckIfUserIsFirstTimerUseCase>(),
          ),
          child: Provider(
            create: (BuildContext context) => ChangeNotifierProvider(
              create: (BuildContext context) => UserProvider(),
            ),
          ),
        ),
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(
            signInWithGoogleUseCase: getIt<SignInWithGoogleUseCase>(),
            autoRouter: getIt<AppRouter>(),
            signInUseCase: getIt<SignInUseCase>(),
            signUpUseCase: getIt<SignUpUseCase>(),
            forgotPasswordUseCase: getIt<ForgotPasswordUseCase>(),
          ),
        ),
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
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: context.mediaQuery.copyWith(
            textScaleFactor:
                context.watch<SettingsBloc>().state.fontSize?.fontSize,
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
