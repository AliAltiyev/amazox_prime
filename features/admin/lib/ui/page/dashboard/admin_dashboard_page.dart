import 'package:admin/admin.dart';

class AdminDashBoardPage extends StatelessWidget {
  const AdminDashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: <PageRouteInfo>[
        const AdminHome(),
        const UsersPageRouter(),
        AdminPageRouter(),
        const SalesPageRouter(),
      ],
      animationCurve: Curves.easeIn,
      backgroundColor: ApplicationColors.pageBackground,
      bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
        return Padding(
          padding: const EdgeInsets.all(
            ApplicationPadding.PADDING_10,
          ),
          child: Expanded(
            child: ApplicationBottomAppBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: <AppBarItem>[
                AppBarItem(
                  selectedColor: ApplicationColors.white,
                  icon: AppIcons.home,
                  title: const Text(StringConstant.productsCount),
                ),
                AppBarItem(
                  selectedColor: ApplicationColors.white,
                  icon: AppIcons.users,
                  title: const Text(
                    StringConstant.users,
                  ),
                ),
                AppBarItem(
                  selectedColor: ApplicationColors.white,
                  icon: AppIcons.add,
                  title: const Text(
                    StringConstant.add,
                  ),
                ),
                AppBarItem(
                  selectedColor: ApplicationColors.white,
                  icon: AppIcons.products,
                  title: const Text(
                    StringConstant.productsCount,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
