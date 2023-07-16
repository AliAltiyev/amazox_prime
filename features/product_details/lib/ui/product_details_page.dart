import 'package:product_details/bloc/produc_count/product_count_cubit.dart';
import 'package:product_details/product_details.dart';

class ProductDetailPage extends StatefulWidget {
  final int productId;

  const ProductDetailPage({
    super.key,
    @PathParam() required this.productId,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: true,
            create: (context) => DetailsBloc(
              getIt.get<FetchProductByIdUseCase>(),
            )..add(
                FetchProductEvent(
                  productId: widget.productId,
                ),
              ),
          ),
          BlocProvider(
            create: (_) => ProductCounterCubit(),
            lazy: true,
          )
        ],
        child: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            if (state is LoadedDetailsState) {
              final data = state.product;
              return Scaffold(
                body: DetailsSliverList(
                  size: size,
                  data: data,
                ),
              );
            } else if (state is LoadingDetailsState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: SizedBox.shrink(),
              );
            }
          },
        ),
      ),
    );
  }
}
