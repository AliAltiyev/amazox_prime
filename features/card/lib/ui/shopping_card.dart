import 'package:card/shopping_card.dart';

class ShappingCard extends StatefulWidget {
  const ShappingCard({super.key});

  @override
  State<ShappingCard> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<ShappingCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            if (state.cart.cartItems.isNotEmpty) {
              return CartBody(
                state: state,
              );
            } else {
              return const EmptyCartBody();
            }
          } else if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return const Center(
              child: SizedBox.shrink(),
            );
          }
        },
      ),
    );
  }
}
