import 'package:home/src/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => instance.get<HomeBloc>(),
        ),
        BlocProvider<MenuBloc>(
          create: (context) => instance.get<MenuBloc>(),
        ),
      ],
      child: Scaffold(
          body: CustomScrollView(slivers: <Widget>[
        const CustomSliverAppBar(),
        const HomeMenuTitle(),
        const SliverToBoxAdapter(child: HomeMenu()),
        BlocBuilder<HomeBloc, ProductsState>(
          builder: (builderContext, state) {
            if (state is LoadedProductsState) {
              return SliverGridList(state: state);
            } else if (state is LoadingProductsState) {
              return SliverToBoxAdapter(
                child: _loadingStateBody(),
              );
            } else {
              return const SliverToBoxAdapter(
                child: SizedBox.shrink(),
              );
            }
          },
        ),
      ])),
    );
  }

  Center _loadingStateBody() {
    return Center(
      child: SpinKitDancingSquare(
        color: ApplicationColors.green,
        size: ApplicationSize.SIZE_50,
        controller: AnimationController(
          vsync: this,
          animationBehavior: AnimationBehavior.preserve,
          duration: DurationEnum.low.duration,
        ),
      ),
    );
  }
}
