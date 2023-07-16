import 'package:card/shopping_card.dart';
import 'package:core/enums/currency.dart';

class CartBody extends StatelessWidget {
  final CartLoaded _state;

  const CartBody({
    required CartLoaded state,
    super.key,
  }) : _state = state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 70,
          color: ApplicationColors.primaryButtonColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  '${_state.getSubtotalString} ${Currency.rubl.value}',
                  style: AppFonts.bold22,
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          _deleteAllCartItems(),
        ],
        title: const Text(
          StringConstant.cart,
        ),
      ),
      body: ListView.builder(
        itemCount: _state.cart.cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          final Product product = _state.cart.cartItems[index];
          return Slidable(
            direction: Axis.horizontal,
            endActionPane:
                ActionPane(motion: const ScrollMotion(), children: <Widget>[
              SlidableAction(
                onPressed: (context) {
                  context.read<CartBloc>().add(
                        RemoveProduct(product),
                      );
                },
                borderRadius: const BorderRadius.all(
                  Radius.circular(Dimensions.SIZE_14),
                ),
                backgroundColor: ApplicationColors.red,
                foregroundColor: ApplicationColors.white,
                icon: AppIcons.delete,
                label: StringConstant.delete,
              ),
              SlidableAction(
                onPressed: (context) {
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
              child: ListTile(
                trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AppAddButton(
                        icon: AppIcons.increament,
                        onPress: () {
                          //TODO: ADD
                        },
                      ),
                      //TODO remove
                      const Text(''),
                      AppAddButton(
                        icon: AppIcons.increament,
                        onPress: () {
                          //TODO: Add
                        },
                      )
                    ]),
                subtitle: RichText(
                  text: TextSpan(
                    text: '${product.price.toString()} ${Currency.rubl.value}',
                    style: AppFonts.normal16
                        .copyWith(color: ApplicationColors.black),
                    children: [
                      TextSpan(
                        text: '  ${product.ml}',
                        style: AppFonts.normal10
                            .copyWith(color: ApplicationColors.black),
                      ),
                    ],
                  ),
                ),
                title: Text(
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  product.name,
                  style: AppFonts.normal12,
                ),
                leading: Card(
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                    fadeInCurve: Curves.bounceInOut,
                    imageUrl: product.image,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  BlocBuilder _deleteAllCartItems() {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<CartBloc>().add(const RemoveAllProducts());
            final snackBar = SnackBar(
              elevation: Dimensions.SIZE_10,
              behavior: SnackBarBehavior.fixed,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                inMaterialBanner: true,
                message: StringConstant.emptyCartSnacBarSubtitle,
                title: StringConstant.emptyCartSnackBarTitle,
                color: ApplicationColors.primaryButtonColor,

                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
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
