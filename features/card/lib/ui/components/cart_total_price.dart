import 'package:card/shopping_card.dart';
import 'package:core/enums/currency.dart';

class CartTotalPrice extends StatelessWidget {
  final CartLoaded _state;

  const CartTotalPrice({
    required CartLoaded state,
    super.key,
  }) : _state = state;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: Dimensions.SIZE_88,
        child: Padding(
          padding: const EdgeInsets.all(
            ApplicationPadding.PADDING_10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${context.read<CartBloc>().totalString} ${Currency.rubl.value}',
                style: AppFonts.normal24,
              ),
              AddToCardButton(
                text: StringConstant.makeOrder,
                onPressed: () {
                  final SnackBar snackBar = SnackBar(
                    elevation: Dimensions.SIZE_10,
                    behavior: SnackBarBehavior.fixed,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      inMaterialBanner: true,
                      message: StringConstant.deliverySubtitle,
                      title: StringConstant.orderSnackBarTitle,
                      color: ApplicationColors.primaryButtonColor,
                      contentType: ContentType.success,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                  context.read<CartBloc>().add(
                        const RemoveAllProducts(),
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
