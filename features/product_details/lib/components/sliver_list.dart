import 'package:product_details/product_details.dart';

class DetailsSliverList extends StatelessWidget {
  const DetailsSliverList({
    super.key,
    required this.size,
    required this.data,
  });

  final Size size;
  final Product data;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        DetilsAppBar(size: size, data: data),
        SliverToBoxAdapter(
          child: Container(
            decoration: const BoxDecoration(
              color: ApplicationColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  Dimensions.SIZE_40,
                ),
              ),
            ),
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.all(ApplicationPadding.PADDING_10),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: ApplicationPadding.PADDING_10),
                    child: Row(
                      children: <Widget>[
                        AppRatingBar(
                          rate: data.rate.toDouble(),
                        ),
                        const SizedBox(
                          width: Dimensions.SIZE_20,
                        ),
                        Text(
                          data.rate.toString(),
                        ),
                        SizedBox(width: size.width / Dimensions.SIZE_6),
                        AppAddButton(
                          icon: AppIcons.increament,
                          onPress: () {
                            context
                                .read<ProductCounterCubit>()
                                .incrementProductCount();
                          },
                        ),
                        BlocBuilder<ProductCounterCubit, int>(
                          builder: (context, state) {
                            return Text(
                              state.toString(),
                              style: AppFonts.normal18,
                            );
                          },
                        ),
                        AppAddButton(
                          onPress: () {
                            context
                                .read<ProductCounterCubit>()
                                .decrementProductCount();
                          },
                          icon: AppIcons.decremeent,
                        ),
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
                    child: Text(
                      data.bigDescription,
                      style: AppFonts.normal16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: ApplicationPadding.PADDING_20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              StringConstant.price,
                              style: AppFonts.normal18,
                            ),
                            Text(
                              '${data.price.toString()} ${Currency.rubl.value}',
                              style: AppFonts.bold24,
                            )
                          ],
                        ),
                        AddToCardButton(
                          onPressed: () {
                            //TODO: Add to card
                          },
                          text: StringConstant.buy,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
