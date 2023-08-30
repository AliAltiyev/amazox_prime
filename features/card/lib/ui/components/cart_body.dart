import 'package:card/shopping_card.dart';

class CartBody extends StatefulWidget {
  final CartLoaded _state;

  const CartBody({
    required CartLoaded state,
    super.key,
  }) : _state = state;

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CartTotalPrice(),
      appBar: AppBar(
        actions: <Widget>[
          _deleteAllCartItems(),
        ],
        title: const Text(
          StringConstant.cart,
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList.builder(
            itemCount: widget._state.cart.cartItems.length,
            itemBuilder: (BuildContext context, int index) {
              final Product product = widget._state.cart.cartItems[index];
              return Slidable(
                direction: Axis.horizontal,
                endActionPane:
                    ActionPane(motion: const ScrollMotion(), children: <Widget>[
                  SlidableAction(
                    onPressed: (BuildContext context) {
                      context.read<CartBloc>().add(
                            RemoveProduct(product),
                          );
                    },
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        Dimensions.SIZE_14,
                      ),
                    ),
                    backgroundColor: ApplicationColors.red,
                    foregroundColor: ApplicationColors.white,
                    icon: AppIcons.delete,
                    label: StringConstant.delete,
                  ),
                  SlidableAction(
                    onPressed: (BuildContext context) {
                      //TODO: Add share feature
                    },
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        Dimensions.SIZE_14,
                      ),
                    ),
                    backgroundColor: ApplicationColors.primaryButtonColor,
                    foregroundColor: ApplicationColors.white,
                    icon: AppIcons.share,
                    label: StringConstant.share,
                  ),
                ]),
                child: Padding(
                  padding: const EdgeInsets.all(
                    ApplicationPadding.PADDING_10,
                  ),
                  child: CartListItem(
                    product: product,
                  ),
                ),
              );
            },
          ),
          CartSublist(state: widget._state),
        ],
      ),
    );
  }

  BlocBuilder<CartBloc, CartState> _deleteAllCartItems() {
    return BlocBuilder<CartBloc, CartState>(
      builder: (BuildContext context, CartState state) {
        return GestureDetector(
          onTap: () {
            context.read<CartBloc>().add(
                  const RemoveAllProducts(),
                );
            final SnackBar snackBar = SnackBar(
              elevation: Dimensions.SIZE_10,
              behavior: SnackBarBehavior.fixed,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                inMaterialBanner: true,
                message: StringConstant.emptyCartSnacBarSubtitle,
                title: StringConstant.emptyCartSnackBarTitle,
                color: ApplicationColors.primaryButtonColor,
                contentType: ContentType.success,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ApplicationPadding.PADDING_20,
            ),
            child: Icon(
              Icons.delete_outline_outlined,
            ),
          ),
        );
      },
    );
  }
}
