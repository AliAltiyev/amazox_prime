import 'package:card/shopping_card.dart';
import 'package:core/enums/currency.dart';

class CartTotalPrice extends StatelessWidget {
  const CartTotalPrice({
    super.key,
  });

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
              CartButton(
                text: StringConstant.makeOrder,
                onPressed: () {
                  context.read<CartBloc>().add(
                        ConfirmOrder(),
                      );
                  context.read<CartBloc>().add(
                        const RemoveAllProducts(),
                      );

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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
