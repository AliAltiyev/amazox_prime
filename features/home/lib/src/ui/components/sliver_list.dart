import 'package:home/src/home.dart';

class SliverGridList extends StatefulWidget {
  const SliverGridList({
    super.key,
    required this.state,
  });

  final LoadedProductsState state;

  @override
  State<SliverGridList> createState() => _SliverGridListState();
}

class _SliverGridListState extends State<SliverGridList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: WidgetConstants.sliverGridDelegateWithFixedCrossAxisCount,
      itemCount: widget.state.products.length,
      itemBuilder: (BuildContext context, int index) {
        final Product data = widget.state.products[index];
        return InkWell(
          onTap: () {
            context.router.push(
              DetailsPage(
                productId: data.id,
              ),
            );
          },
          child: CustomCard(
            product: data,
          ),
        );
      },
    );
  }
}
