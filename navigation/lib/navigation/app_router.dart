import 'package:login/login.dart';
import 'package:navigation/navigation.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      initial: true,
      name: 'login ',
      page: LoginPage,
    ),
    AutoRoute(
      name: 'dashBoardPage',
      page: DashboardView,
      children: [
        AutoRoute(
          path: 'home',
          name: 'homeRouter',
          page: EmptyPageRouter,
          children: [
            AutoRoute(
              path: '',
              page: HomeView,
              name: 'homePage',
            ),
            AutoRoute(
              path: ':productId',
              page: ProductDetailPage,
              name: 'detailsPage',
            ),
          ],
        ),
        AutoRoute(
          path: 'shopingCardPage',
          name: 'ShappngCardRouter',
          page: ShappingCard,
        ),
        AutoRoute(
          path: 'orderPage',
          name: 'OrderHistoryRouter',
          page: OrderHistoryPage,
        ),
        AutoRoute(
          path: 'settingsPage',
          name: 'SettingsRouter',
          page: SettingsPage,
        ),
      ],
    )
  ],
)
class AppRouter extends _$AppRouter {}

class EmptyPageRouter extends AutoRouter {
  const EmptyPageRouter({super.key});
}
