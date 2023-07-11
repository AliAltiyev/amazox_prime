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
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            getProductsUseCase: getIt<FetchProductsUseCase>(),
          ),
        ),
        BlocProvider<MenuBloc>(
          create: (context) => MenuBloc(
            fetchMenuItemsUseCase: getIt<FetchMenuItemsUseCase>(),
          ),
        ),
      ],
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            AppSliverAppBar(
              child: Image.asset(
                ImagePaths.sliverAppBarBackground,
                fit: BoxFit.fill,
              ),
            ),
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
          ],
        ),
      ),
    );
  }

  Center _loadingStateBody() {
    return Center(
      child: SpinKitDancingSquare(
        color: ApplicationColors.green,
        size: Dimensions.SIZE_50,
        controller: AnimationController(
          vsync: this,
          animationBehavior: AnimationBehavior.preserve,
          duration: DurationEnum.low.duration,
        ),
      ),
    );
  }
}
