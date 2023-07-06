import 'package:navigation/navigation.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomeView,
      path: '/',
      initial: true,
      name: 'home',
    ),
    AutoRoute(
      name: 'product_details',
      page: ProductDetailPage,
      path: 'product_details/:productId',
    ),
  ],
)
class AppRouter extends _$AppRouter {}
