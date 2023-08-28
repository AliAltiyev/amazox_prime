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
                  child: Column(children: <Widget>[
                    HomeMenuTitle(),
                    SizedBox(height: Dimensions.SIZE_10),
                    HomeMenu()
                  ]),
                ),
              ),
              body: AppRefreshView(
                size: size,
                onRefresh: () {
                  return Future<void>(
                    () => context.read<HomeBloc>().add(FetchProductsEvent()),
                  );
                },
                child: Stack(children: <Widget>[
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
                ]),
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

class HomeContent extends StatelessWidget {
  const HomeContent({
    required PageController pageController,
    required double currentPage,
    required LoadedProductsState state,
    super.key,
  })  : _pageController = pageController,
        _currentPage = currentPage,
        _state = state;

  final PageController _pageController;
  final double _currentPage;
  final LoadedProductsState _state;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: Dimensions.SIZE_1_6,
      alignment: Alignment.bottomCenter,
      child: PageView.builder(
        controller: _pageController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _state.products.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          if (index == Dimensions.SIZE_0) {
            return const SizedBox.shrink();
          }
          final Product product =
              _state.products[index - Dimensions.SIZE_1.toInt()];
          final double result = _currentPage - index + Dimensions.SIZE_1;
          final double value =
              Dimensions.SIZE_MINUS_0_4 * result + Dimensions.SIZE_1;
          final double opasity = value.clamp(
            Dimensions.SIZE_0_1,
            Dimensions.SIZE_1,
          );
          return Padding(
            padding: const EdgeInsets.only(bottom: Dimensions.SIZE_40),
            child: SizedBox(
              height: Dimensions.SIZE_200,
              child: Transform(
                alignment: Alignment.bottomCenter,
                transform: Matrix4.identity()
                  ..setEntry(
                    Dimensions.SIZE_3.toInt(),
                    Dimensions.SIZE_2.toInt(),
                    Dimensions.SIZE_0_8,
                  )
                  ..translate(
                      Dimensions.SIZE_0,
                      (MediaQuery.of(context).size.height / Dimensions.SIZE_3) *
                          (Dimensions.SIZE_1 - value).abs())
                  ..scale(value),
                child: Opacity(
                  opacity: opasity,
                  child: InkWell(
                    onTap: () {
                      context.router.push<Object?>(
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
            ),
          );
        },
      ),
    );
  }
}

class HomeTitle extends StatelessWidget {
  final double _currentPage;
  final LoadedProductsState _state;
  const HomeTitle({
    required double currentPage,
    required LoadedProductsState state,
    super.key,
  })  : _currentPage = currentPage,
        _state = state;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: Dimensions.SIZE_0,
      left: Dimensions.SIZE_0,
      top: Dimensions.SIZE_40,
      height: Dimensions.SIZE_50,
      child: Column(children: <Widget>[
        Text(
          _state.products[_currentPage.toInt()].name,
          style: AppFonts.bold24,
          overflow: TextOverflow.ellipsis,
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
    required this.size,
    super.key,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: Dimensions.SIZE_20,
      right: Dimensions.SIZE_20,
      bottom: -size.height * Dimensions.SIZE_0_2,
      height: size.height * Dimensions.SIZE_0_4,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ApplicationColors.disabledColor
                  .withOpacity(Dimensions.SIZE_0_2),
              blurRadius: Dimensions.SIZE_40,
              offset: Offset.zero,
              spreadRadius: Dimensions.SIZE_50,
            )
          ],
        ),
      ),
    );
  }
}
