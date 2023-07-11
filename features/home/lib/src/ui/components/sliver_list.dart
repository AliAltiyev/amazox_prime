import 'package:home/src/home.dart';

class SliverGridList extends StatelessWidget {
  const SliverGridList({
    super.key,
    required this.state,
  });

  final LoadedProductsState state;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: WidgetConstants.sliverGridDelegateWithFixedCrossAxisCount,
      itemCount: state.products.length,
      itemBuilder: (context, index) {
        final data = state.products[index];
        return InkWell(
          onTap: () {
            context.router.push(
              DetailsPage(
                productId: data.id,
              ),
            );
          },
          child: Hero(
            tag: '123',
            child: CustomCard(
              product: data,
            ),
          ),
        );
      },
    );
  }
}
