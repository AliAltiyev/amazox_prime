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
    Home.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    Product_details.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<Product_detailsArgs>(
          orElse: () =>
              Product_detailsArgs(productId: pathParams.getInt('productId')));
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
          Home.name,
          path: '/',
        ),
        RouteConfig(
          Product_details.name,
          path: 'product_details/:productId',
        ),
      ];
}

/// generated route for
/// [HomeView]
class Home extends PageRouteInfo<void> {
  const Home()
      : super(
          Home.name,
          path: '/',
        );

  static const String name = 'Home';
}

/// generated route for
/// [ProductDetailPage]
class Product_details extends PageRouteInfo<Product_detailsArgs> {
  Product_details({
    Key? key,
    required int productId,
  }) : super(
          Product_details.name,
          path: 'product_details/:productId',
          args: Product_detailsArgs(
            key: key,
            productId: productId,
          ),
          rawPathParams: {'productId': productId},
        );

  static const String name = 'Product_details';
}

class Product_detailsArgs {
  const Product_detailsArgs({
    this.key,
    required this.productId,
  });

  final Key? key;

  final int productId;

  @override
  String toString() {
    return 'Product_detailsArgs{key: $key, productId: $productId}';
  }
}
