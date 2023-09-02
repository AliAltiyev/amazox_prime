import 'package:domain/usecase/get_menu.dart';
import 'package:home/src/bloc/menu/menu_bloc.dart';
import 'package:home/src/home.dart';
import 'package:home/src/ui/components/menu.dart';
import 'package:home/src/ui/components/menu_title.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final PageController _pageController = PageController(
    viewportFraction: Dimensions.SIZE_0_4,
  );
  double _currentPage = 0.0;

  void listenScroll() {
    setState(() {
      _currentPage = _pageController.page!;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(listenScroll);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(
            router: getIt<AppRouter>(),
            connectionUseCase: getIt<Connection>(),
            getProductsUseCase: getIt<FetchProductsUseCase>(),
          ),
        ),
        BlocProvider<MenuBloc>(
          create: (BuildContext context) => MenuBloc(
            fetchMenuItemsUseCase: getIt<FetchMenuItemsUseCase>(),
          ),
        ),
      ],
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (BuildContext context, HomeState state) {
          if (state is NoInternetConnectionState) {
            AppToast.showToast();
          }
        },
        builder: (BuildContext context, HomeState homeState) {
          if (homeState is LoadedProductsState) {
            return Scaffold(
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.SIZE_200),
                child: Padding(
                  padding: EdgeInsets.only(top: Dimensions.SIZE_50),
                  child: Column(
                    children: <Widget>[
                      HomeMenuTitle(),
                      SizedBox(height: Dimensions.SIZE_10),
                      HomeMenu()
                    ],
                  ),
                ),
              ),
              body: AppRefreshView(
                size: size,
                onRefresh: () {
                  return Future<void>(
                    () => context.read<HomeBloc>().add(FetchProductsEvent()),
                  );
                },
                child: Stack(
                  children: <Widget>[
                    HomeProductShadow(size: size),
                    HomeTitle(
                      currentPage: _currentPage,
                      state: homeState,
                    ),
                    HomeContent(
                      state: homeState,
                      pageController: _pageController,
                      currentPage: _currentPage,
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: ApplicationColors.primaryButtonColor,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.removeListener(listenScroll);
    _pageController.dispose();
    super.dispose();
  }
}
