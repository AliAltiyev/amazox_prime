import 'package:home/src/home.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required Product product,
  }) : _product = product;

  final Product _product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.all(ApplicationPadding.PADDING_4),
      child: Stack(
        children: <Widget>[
          Card(
            color: ApplicationColors.white,
            elevation: Dimensions.SIZE_10,
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(
                ApplicationPadding.PADDING_4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: size.height / Dimensions.SIZE_6,
                    width: size.width / Dimensions.SIZE_9,
                    child: Hero(
                      tag: HeroTags.homeToDetails,
                      child: AppCachedNetworkImage(
                        url: _product.image,
                      ),
                    ),
                  ),
                  _detailsText(
                    size: size,
                    context: context,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding _detailsText({
    required Size size,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ApplicationPadding.PADDING_4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: Dimensions.SIZE_10),
          Text(
            '${_product.price}${Currency.rubl.value}',
            style: AppFonts.bold16,
          ),
          Text(
            _product.name,
            style: AppFonts.normal18,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '${_product.ml} ${Weight.ml.value}',
            style: AppFonts.bold12,
          ),
          const SizedBox(height: Dimensions.SIZE_30),
          BlocBuilder<CartBloc, CartState>(
            builder: (BuildContext context, CartState state) {
              return CartButton(
                text: StringConstant.addToCard,
                onPressed: () {
                  context.read<CartBloc>().add(
                        AddProduct(_product),
                      );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
