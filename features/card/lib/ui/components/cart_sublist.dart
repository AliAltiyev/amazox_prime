import 'package:card/shopping_card.dart';
import 'package:core/enums/currency.dart';

class CartSublist extends StatelessWidget {
  final CartLoaded _state;

  const CartSublist({
    required CartLoaded state,
    super.key,
  }) : _state = state;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return SliverList(
      key: const ValueKey<String>(
        StringConstant.key,
      ),
      delegate: SliverChildListDelegate(
        <Widget>[
          ListTile(
            onTap: () {
              showBottomSheet(
                backgroundColor: ApplicationColors.white,
                clipBehavior: Clip.antiAlias,
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: size.height / Dimensions.SIZE_4,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          StringConstant.delivery,
                          style: AppFonts.normal24,
                        ),
                        Text(
                          StringConstant.deliverySubtitle,
                          textAlign: TextAlign.center,
                          style: AppFonts.normal14.copyWith(),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            title: const Text(StringConstant.delivery),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '${context.read<CartBloc>().deliveryFeeString} ${Currency.rubl.value}',
                  style: AppFonts.normal14,
                ),
                AppIcons.chevronRightOutlined
              ],
            ),
          ),
          ListTile(
            title: const Text(
              StringConstant.serviceFee,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '${_state.serviceFee} ${Currency.rubl.value}',
                  style: AppFonts.normal14,
                ),
                AppIcons.chevronRightOutlined
              ],
            ),
          )
        ],
      ),
    );
  }
}
