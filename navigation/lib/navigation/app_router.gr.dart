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
    DashBoardPage.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DashboardView(),
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
      );
    },
    SettingsRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    HomePage.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    DetailsPage.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailsPageArgs>(
          orElse: () =>
              DetailsPageArgs(productId: pathParams.getInt('productId')));
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ProductDetailPage(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          DashBoardPage.name,
          path: '/',
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
        )
      ];
}

/// generated route for
/// [DashboardView]
class DashBoardPage extends PageRouteInfo<void> {
  const DashBoardPage({List<PageRouteInfo>? children})
      : super(
          DashBoardPage.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'DashBoardPage';
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
