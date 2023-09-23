import 'package:admin/admin.dart';

class AdminDashBoardPage extends StatelessWidget {
  const AdminDashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const <PageRouteInfo>[
        AdminHome(),
        UsersPageRouter(),
        AdminPageRouter(),
        SalesPageRouter(),
        ProductCountPageRouter(),
      ],
      animationCurve: Curves.easeIn,
      backgroundColor: ApplicationColors.pageBackground,
      bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
        return Padding(
          padding: const EdgeInsets.all(
            ApplicationPadding.PADDING_10,
          ),
          child: ApplicationBottomAppBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: <AppBarItem>[
              AppBarItem(
                selectedColor: ApplicationColors.white,
                icon: AppIcons.home,
                title: const Text(StringConstant.admin),
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
                icon: AppIcons.admin,
                title: const Text(
                  StringConstant.productsCount,
                ),
              ),
              AppBarItem(
                selectedColor: ApplicationColors.white,
                icon: AppIcons.sales,
                title: const Text(
                  StringConstant.sales,
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
        );
      },
    );
  }
}
