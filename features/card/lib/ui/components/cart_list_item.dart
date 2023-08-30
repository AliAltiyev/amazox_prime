import 'package:card/shopping_card.dart';
import 'package:core/enums/currency.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppAddButton(
              icon: AppIcons.increament,
              onPress: () {
                //TODO: Add increment
              },
            ),
            Text(
              Dimensions.SIZE_1.toInt().toString(),
            ),
            AppAddButton(
              icon: AppIcons.increament,
              onPress: () {
                //TODO: Adddecrement
              },
            )
          ]),
      subtitle: RichText(
        text: TextSpan(
          text: '${product.price.toString()} ${Currency.rubl.value}',
          style: AppFonts.normal16.copyWith(
            color: ApplicationColors.black,
          ),
          children: <InlineSpan>[
            TextSpan(
              text: '  ${product.ml}',
              style: AppFonts.normal10.copyWith(
                color: ApplicationColors.black,
              ),
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
    );
  }
}
