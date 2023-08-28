import 'package:domain/usecase/get_menu.dart';
import 'package:home/src/bloc/menu/menu_bloc.dart';
import 'package:home/src/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final PageController _pageController = PageController(
    viewportFraction: 0.3,
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
  void dispose() {
    _pageController.removeListener(listenScroll);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return MultiBlocProvider(
        providers: <BlocProvider>[
          BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc(
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
        child: BlocBuilder<HomeBloc, HomeState>(
            builder: (BuildContext context, HomeState homeState) {
          if (homeState is LoadedProductsState) {
            return Scaffold(
              body: SafeArea(
                child: AppRefreshView(
                  size: size,
                  onRefresh: () {
                    return Future<void>(
                      () => context.read<HomeBloc>().add(FetchProductsEvent()),
                    );
                  },
                  child: Stack(children: <Widget>[
                    HomeProductShadow(size: size),
                    HomeTitle(currentPage: _currentPage, state: homeState),
                    HomeContent(
                      state: homeState,
                      pageController: _pageController,
                      currentPage: _currentPage,
                    )
                  ]),
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        }));
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required PageController pageController,
    required double currentPage,
    required LoadedProductsState state,
  })  : _pageController = pageController,
        _currentPage = currentPage,
        _state = state;

  final PageController _pageController;
  final double _currentPage;
  final LoadedProductsState _state;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.6,
      alignment: Alignment.bottomCenter,
      child: PageView.builder(
        controller: _pageController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _state.products.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const SizedBox.shrink();
          }
          final Product product = _state.products[index - 1];
          final double result = _currentPage - index + 1;
          final double value = -0.4 * result + 1;
          final double opasity = value.clamp(0.1, 1.0);
          return Padding(
            padding: const EdgeInsets.only(
              bottom: Dimensions.SIZE_40,
            ),
            child: Transform(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.8)
                ..translate(
                    0.0,
                    (MediaQuery.of(context).size.height / 3) *
                        (1 - value).abs())
                ..scale(value),
              child: Opacity(
                opacity: opasity,
                child: InkWell(
                  onTap: () {
                    context.router.push(
                      DetailsPage(
                        productId: _state.products[index].id,
                      ),
                    );
                  },
                  child: AppCachedNetworkImage(
                    url: product.image,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
    required double currentPage,
    required LoadedProductsState state,
  })  : _currentPage = currentPage,
        _state = state;

  final double _currentPage;
  final LoadedProductsState _state;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      top: 20,
      height: 100,
      child: Column(children: <Widget>[
        Text(
          _state.products[_currentPage.toInt()].name,
          style: AppFonts.bold24,
        ),
        Text(
          '${_state.products[_currentPage.toInt()].price.toString()} ${Currency.rubl.value}',
          style: AppFonts.bold18,
        ),
      ]),
    );
  }
}

class HomeProductShadow extends StatelessWidget {
  const HomeProductShadow({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      right: 20,
      bottom: -size.height * 0.20,
      height: size.height * 0.5,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ApplicationColors.disabledColor.withOpacity(0.2),
              blurRadius: 40,
              offset: Offset.zero,
              spreadRadius: 50,
            )
          ],
        ),
      ),
    );
  }
}
