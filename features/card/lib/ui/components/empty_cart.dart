import 'package:card/shopping_card.dart';

class EmptyCartBody extends StatelessWidget {
  const EmptyCartBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringConstant.cart,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: size.height / Dimensions.SIZE_4,
            width: size.width / Dimensions.SIZE_2,
            child: Lottie.asset(
              animate: true,
              ImagePaths.emptyCart,
              repeat: true,
            ),
          ),
          Column(
            children: <Widget>[
              Text(
                'Ничего нет',
                style: AppFonts.bold18,
              ),
              SizedBox(
                height: size.height / Dimensions.SIZE_20,
              ),
              const Text(
                'Перейдите в список ресторанов,чтобы выбрать понравившийсы и оформить из него заказ',
                textAlign: TextAlign.center,
              )
            ],
          )
        ],
      ),
    );
  }
}
