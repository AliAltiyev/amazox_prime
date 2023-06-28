import 'package:home/src/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (contextProvider) => instance.get<HomeBloc>(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    instance.get<HomeBloc>().add(FetchProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      const CustomSliverAppBar(),
      SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.all(
          ApplicationSize.SIZE_8,
        ),
        child: SearchTextField(
          labelText: StringConstant.search,
          textEditingController: TextEditingController(),
        ),
      )),
      BlocBuilder<HomeBloc, ProductsState>(
        bloc: instance.get<HomeBloc>(),
        builder: (builderContext, state) {
          if (state is LoadedProductsState) {
            return _loadedStateBody(
              state,
            );
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
    ]));
  }

  SliverGrid _loadedStateBody(
    LoadedProductsState state,
  ) {
    return SliverGrid.builder(
      gridDelegate: WidgetConstants.sliverGridDelegateWithFixedCrossAxisCount,
      itemCount: state.products.length,
      itemBuilder: (context, index) {
        final data = state.products[index];
        return CustomCard(
          product: data,
        );
      },
    );
  }

  Center _loadingStateBody() {
    return Center(
      child: SpinKitSquareCircle(
        color: ApplicationColors.white,
        size: ApplicationSize.SIZE_50,
        controller: AnimationController(
          vsync: this,
          duration: DurationEnum.normal.duration,
        ),
      ),
    );
  }
}
