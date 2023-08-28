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
      child: Scaffold(
        body: AppRefreshView(
          size: size,
          onRefresh: () {
            return Future<void>(
              () => context.read<HomeBloc>().add(FetchProductsEvent()),
            );
          },
          child: CustomScrollView(
            slivers: <Widget>[
              AppSliverAppBar(
                child: Image.asset(
                  ImagePaths.sliverAppBarBackground,
                  fit: BoxFit.fill,
                ),
              ),
              const HomeMenuTitle(),
              const SliverToBoxAdapter(child: HomeMenu()),
              BlocConsumer<HomeBloc, HomeState>(
                listener: (BuildContext context, HomeState state) {
                  if (state is NoInternetConnectionState) {
                    AppToast.showToast();
                  }
                },
                builder: (BuildContext context, HomeState state) {
                  return BlocBuilder<HomeBloc, HomeState>(
                    builder: (BuildContext builderContext, HomeState state) {
                      if (state is LoadedProductsState) {
                        return SliverGridList(
                          state: state,
                        );
                      } else if (state is LoadingProductsState) {
                        return const SliverToBoxAdapter(
                          child: Center(
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor:
                                  ApplicationColors.primaryButtonColor,
                            ),
                          ),
                        );
                      } else {
                        return const SliverToBoxAdapter(
                          child: SizedBox.shrink(),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
