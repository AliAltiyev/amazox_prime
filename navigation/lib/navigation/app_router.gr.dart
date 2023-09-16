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
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DashboardView(),
      );
    },
    AdminDashboard.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AdminDashBoardPage(),
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
    UsersPageRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AppUsersPage(),
      );
    },
    SalesPageRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SalesPage(),
      );
    },
    ProductCountPageRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ProductCountPage(),
      );
    },
    AdminPageRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AdminPage(),
      );
    },
    AdminHome.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
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
          AdminDashboard.name,
          path: '/admin-dash-board-page',
          children: [
            RouteConfig(
              UsersPageRouter.name,
              path: 'app-users-page',
              parent: AdminDashboard.name,
            ),
            RouteConfig(
              SalesPageRouter.name,
              path: 'sales-page',
              parent: AdminDashboard.name,
            ),
            RouteConfig(
              ProductCountPageRouter.name,
              path: 'product-count-page',
              parent: AdminDashboard.name,
            ),
            RouteConfig(
              AdminPageRouter.name,
              path: 'admin-page',
              parent: AdminDashboard.name,
            ),
            RouteConfig(
              AdminHome.name,
              path: '',
              parent: AdminDashboard.name,
            ),
          ],
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
class DashBoardPage extends PageRouteInfo<void> {
  const DashBoardPage({List<PageRouteInfo>? children})
      : super(
          DashBoardPage.name,
          path: '/dashboard-view',
          initialChildren: children,
        );

  static const String name = 'DashBoardPage';
}

/// generated route for
/// [AdminDashBoardPage]
class AdminDashboard extends PageRouteInfo<void> {
  const AdminDashboard({List<PageRouteInfo>? children})
      : super(
          AdminDashboard.name,
          path: '/admin-dash-board-page',
          initialChildren: children,
        );

  static const String name = 'AdminDashboard';
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

/// generated route for
/// [AppUsersPage]
class UsersPageRouter extends PageRouteInfo<void> {
  const UsersPageRouter()
      : super(
          UsersPageRouter.name,
          path: 'app-users-page',
        );

  static const String name = 'UsersPageRouter';
}

/// generated route for
/// [SalesPage]
class SalesPageRouter extends PageRouteInfo<void> {
  const SalesPageRouter()
      : super(
          SalesPageRouter.name,
          path: 'sales-page',
        );

  static const String name = 'SalesPageRouter';
}

/// generated route for
/// [ProductCountPage]
class ProductCountPageRouter extends PageRouteInfo<void> {
  const ProductCountPageRouter()
      : super(
          ProductCountPageRouter.name,
          path: 'product-count-page',
        );

  static const String name = 'ProductCountPageRouter';
}

/// generated route for
/// [AdminPage]
class AdminPageRouter extends PageRouteInfo<void> {
  const AdminPageRouter()
      : super(
          AdminPageRouter.name,
          path: 'admin-page',
        );

  static const String name = 'AdminPageRouter';
}

/// generated route for
/// [HomeView]
class AdminHome extends PageRouteInfo<void> {
  const AdminHome()
      : super(
          AdminHome.name,
          path: '',
        );

  static const String name = 'AdminHome';
}
