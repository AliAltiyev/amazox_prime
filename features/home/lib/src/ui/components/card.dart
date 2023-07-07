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
      child: Card(
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
                height: size.height / Dimensions.SIZE_4,
                width: size.width / Dimensions.SIZE_9,
                child: AppCachedNetworkImage(
                  url: _product.image,
                ),
              ),
              _detailsText(
                size: size,
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _detailsText({
    required Size size,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ApplicationPadding.PADDING_4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            '${_product.price}${Currency.rubl.value}',
            style: AppFonts.normal24,
          ),
          Text(
            _product.name,
            style: AppFonts.normal18,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: size.height / Dimensions.SIZE_120,
          ),
          Text(
            '${_product.ml.toString()} ${Weight.ml.value}',
            style: AppFonts.bold14,
          ),
          SizedBox(
            height: size.height / Dimensions.SIZE_120,
          ),
          AddToCardButton(
            text: StringConstant.addToCard,
            onPressed: () {
              //TODO Add navigation
            },
          )
        ],
      ),
    );
  }
}
