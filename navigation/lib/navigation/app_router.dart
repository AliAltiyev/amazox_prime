import 'package:navigation/navigation.dart';

part 'app_router.gr.dart';

const _duration = 1000;

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      name: 'OnBoardingPage',
      page: OnBoardingScreen,
      path: '/',
    ),
    AutoRoute(
      path: 'signIn',
      name: 'SignInPage',
      page: SignInScreen,
    ),
    AutoRoute(
      path: 'signUp',
      name: 'SignUpPage',
      page: SignUpScreen,
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
            CustomRoute(
              path: '',
              page: HomeView,
              name: 'homePage',
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              path: ':productId',
              page: ProductDetailPage,
              name: 'detailsPage',
              durationInMilliseconds: _duration,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
          ],
        ),
        AutoRoute(
          path: 'shopingCardPage',
          name: 'ShappngCardRouter',
          page: ShappingCard,
        ),
        AutoRoute(
          maintainState: false,
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
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      path: 'admin',
      name: 'AdminRouter',
      page: AdminPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}

class EmptyPageRouter extends AutoRouter {
  const EmptyPageRouter({super.key});
}
