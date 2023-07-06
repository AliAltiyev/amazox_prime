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

    return BlocProvider(
      lazy: true,
      create: (context) => DetailsBloc(
        getIt.get<FetchProductByIdUseCase>(),
      )..add(FetchProductEvent(productId: widget.productId)),
      child: Scaffold(
        body: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            if (state is LoadedDetailsState) {
              final data = state.product;
              return Scaffold(
                body: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      actions: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share_outlined,
                              color: ApplicationColors.white,
                            ))
                      ],
                      floating: true,
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(
                          40,
                        ),
                        child: Container(
                          width: size.width,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                ApplicationSize.SIZE_50,
                              ),
                              topRight: Radius.circular(
                                ApplicationSize.SIZE_50,
                              ),
                            ),
                            color: ApplicationColors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 50, left: ApplicationPadding.PADDING_20),
                              child: Text(
                                data.name,
                                style: AppFonts.bold18.copyWith(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      expandedHeight: size.height / ApplicationSize.SIZE_4,
                      flexibleSpace: FlexibleSpaceBar(
                        background: CachedNetworkImage(
                          imageUrl: data.image,
                          width: size.width,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        decoration: const BoxDecoration(
                            color: ApplicationColors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40))),
                        height: size.height,
                        child: Padding(
                          padding: const EdgeInsets.all(
                              ApplicationPadding.PADDING_10),
                          child: Column(
                            children: <Widget>[
                              //TODO remove
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: ApplicationPadding.PADDING_10),
                                child: Row(
                                  children: [
                                    AppRatingBar(
                                      rate: data.rate.toDouble(),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(data.rate.toString()),
                                    SizedBox(
                                        width: size.width /
                                            ApplicationSize.SIZE_6),
                                    const AppAddButton(
                                      icon: Icons.add,
                                    ),
                                    Text(
                                      '0',
                                      style: AppFonts.normal18,
                                    ),
                                    const AppAddButton(
                                      icon: Icons.remove,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                data.description,
                                style: AppFonts.normal16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: ApplicationPadding.PADDING_20,
                                ),
                                child: Text(
                                  data.bigDescription,
                                  style: AppFonts.normal16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: ApplicationPadding.PADDING_20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          'Сумма',
                                          style: AppFonts.normal18,
                                        ),
                                        Text(
                                          '${data.price.toString()} ${Currency.rubl.value}',
                                          style: AppFonts.bold24,
                                        )
                                      ],
                                    ),
                                    AddToCardButton(
                                      onPressed: () {},
                                      text: 'Купить',
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if (state is LoadingDetailsState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FailedDetailsState) {
              return Center(
                  child: Text(
                state.message,
              ));
            } else {
              return const Center(
                child: Text('huy poymi'),
              );
            }
          },
        ),
      ),
    );
  }
}

class AppAddButton extends StatelessWidget {
  final IconData _icon;
  const AppAddButton({
    required IconData icon,
    super.key,
  }) : _icon = icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        ApplicationPadding.PADDING_12,
      ),
      child: GestureDetector(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(ApplicationSize.SIZE_20),
            ),
            color: ApplicationColors.primaryButtonColor,
          ),
          child: Icon(
            _icon,
            size: ApplicationSize.SIZE_40,
          ),
        ),
      ),
    );
  }
}
