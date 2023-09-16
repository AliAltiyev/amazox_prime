// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    OnBoardingPage.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OnBoardingScreen(),
      );
    },
    SignInPage.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    SignUpPage.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    DashBoardPage.name: (routeData) {
      final args = routeData.argsAs<DashBoardPageArgs>(
          orElse: () => const DashBoardPageArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DashboardView(
          isAdminPanel: args.isAdminPanel,
          key: args.key,
        ),
      );
    },
    AdminRouter.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const AdminPage(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyPageRouter(),
      );
    },
    ShappngCardRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ShappingCard(),
      );
    },
    OrderHistoryRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OrderHistoryPage(),
        maintainState: false,
      );
    },
    SettingsRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    HomePage.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DetailsPage.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailsPageArgs>(
          orElse: () =>
              DetailsPageArgs(productId: pathParams.getInt('productId')));
      return CustomPage<dynamic>(
        routeData: routeData,
        child: ProductDetailPage(
          key: args.key,
          productId: args.productId,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          OnBoardingPage.name,
          path: '/',
        ),
        RouteConfig(
          SignInPage.name,
          path: 'signIn',
        ),
        RouteConfig(
          SignUpPage.name,
          path: 'signUp',
        ),
        RouteConfig(
          DashBoardPage.name,
          path: '/dashboard-view',
          children: [
            RouteConfig(
              HomeRouter.name,
              path: 'home',
              parent: DashBoardPage.name,
              children: [
                RouteConfig(
                  HomePage.name,
                  path: '',
                  parent: HomeRouter.name,
                ),
                RouteConfig(
                  DetailsPage.name,
                  path: ':productId',
                  parent: HomeRouter.name,
                ),
              ],
            ),
            RouteConfig(
              ShappngCardRouter.name,
              path: 'shopingCardPage',
              parent: DashBoardPage.name,
            ),
            RouteConfig(
              OrderHistoryRouter.name,
              path: 'orderPage',
              parent: DashBoardPage.name,
            ),
            RouteConfig(
              SettingsRouter.name,
              path: 'settingsPage',
              parent: DashBoardPage.name,
            ),
          ],
        ),
        RouteConfig(
          AdminRouter.name,
          path: 'admin',
        ),
      ];
}

/// generated route for
/// [OnBoardingScreen]
class OnBoardingPage extends PageRouteInfo<void> {
  const OnBoardingPage()
      : super(
          OnBoardingPage.name,
          path: '/',
        );

  static const String name = 'OnBoardingPage';
}

/// generated route for
/// [SignInScreen]
class SignInPage extends PageRouteInfo<void> {
  const SignInPage()
      : super(
          SignInPage.name,
          path: 'signIn',
        );

  static const String name = 'SignInPage';
}

/// generated route for
/// [SignUpScreen]
class SignUpPage extends PageRouteInfo<void> {
  const SignUpPage()
      : super(
          SignUpPage.name,
          path: 'signUp',
        );

  static const String name = 'SignUpPage';
}

/// generated route for
/// [DashboardView]
class DashBoardPage extends PageRouteInfo<DashBoardPageArgs> {
  DashBoardPage({
    bool isAdminPanel = false,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DashBoardPage.name,
          path: '/dashboard-view',
          args: DashBoardPageArgs(
            isAdminPanel: isAdminPanel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DashBoardPage';
}

class DashBoardPageArgs {
  const DashBoardPageArgs({
    this.isAdminPanel = false,
    this.key,
  });

  final bool isAdminPanel;

  final Key? key;

  @override
  String toString() {
    return 'DashBoardPageArgs{isAdminPanel: $isAdminPanel, key: $key}';
  }
}

/// generated route for
/// [AdminPage]
class AdminRouter extends PageRouteInfo<void> {
  const AdminRouter()
      : super(
          AdminRouter.name,
          path: 'admin',
        );

  static const String name = 'AdminRouter';
}

/// generated route for
/// [EmptyPageRouter]
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter({List<PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [ShappingCard]
class ShappngCardRouter extends PageRouteInfo<void> {
  const ShappngCardRouter()
      : super(
          ShappngCardRouter.name,
          path: 'shopingCardPage',
        );

  static const String name = 'ShappngCardRouter';
}

/// generated route for
/// [OrderHistoryPage]
class OrderHistoryRouter extends PageRouteInfo<void> {
  const OrderHistoryRouter()
      : super(
          OrderHistoryRouter.name,
          path: 'orderPage',
        );

  static const String name = 'OrderHistoryRouter';
}

/// generated route for
/// [SettingsPage]
class SettingsRouter extends PageRouteInfo<void> {
  const SettingsRouter()
      : super(
          SettingsRouter.name,
          path: 'settingsPage',
        );

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [HomeView]
class HomePage extends PageRouteInfo<void> {
  const HomePage()
      : super(
          HomePage.name,
          path: '',
        );

  static const String name = 'HomePage';
}

/// generated route for
/// [ProductDetailPage]
class DetailsPage extends PageRouteInfo<DetailsPageArgs> {
  DetailsPage({
    Key? key,
    required int productId,
  }) : super(
          DetailsPage.name,
          path: ':productId',
          args: DetailsPageArgs(
            key: key,
            productId: productId,
          ),
          rawPathParams: {'productId': productId},
        );

  static const String name = 'DetailsPage';
}

class DetailsPageArgs {
  const DetailsPageArgs({
    this.key,
    required this.productId,
  });

  final Key? key;

  final int productId;

  @override
  String toString() {
    return 'DetailsPageArgs{key: $key, productId: $productId}';
  }
}
