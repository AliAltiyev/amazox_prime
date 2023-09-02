import 'package:product_details/product_details.dart';

class DetailsSliverList extends StatelessWidget {
  const DetailsSliverList({
    required this.size,
    required this.data,
    super.key,
  });

  final Size size;
  final Product data;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        DetailsAppBar(
          size: size,
          data: data,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(ApplicationPadding.PADDING_10),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: ApplicationPadding.PADDING_10,
                  ),
                  child: Row(
                    children: <Widget>[
                      AppRatingBar(rate: data.rate.toDouble()),
                      const SizedBox(width: Dimensions.SIZE_20),
                      Text(
                        data.rate.toString(),
                      ),
                      SizedBox(
                        width: size.width / Dimensions.SIZE_6,
                      ),
                      Text(
                        '${data.price.toString()} ${Currency.rubl.value}',
                        style: AppFonts.bold24,
                      )
                    ],
                  ),
                ),
                Text(
                  data.description,
                  style: AppFonts.normal16,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: ApplicationPadding.PADDING_20,
                  ),
                  child: Expanded(
                    child: Text(
                      data.bigDescription,
                      style: AppFonts.normal16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: ApplicationPadding.PADDING_20,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      BlocBuilder<CartBloc, CartState>(
                        builder: (BuildContext context, CartState state) {
                          return Padding(
                            padding: const EdgeInsets.all(Dimensions.SIZE_10),
                            child: SizedBox(
                              height: Dimensions.SIZE_80,
                              width: size.width / Dimensions.SIZE_1_2,
                              child: AddToCardButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(AddProduct(data));
                                },
                                text: StringConstant.buy,
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
