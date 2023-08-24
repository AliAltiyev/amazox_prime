import 'package:order/order.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<OrderHistoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(FetchAllOrders());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (BuildContext context, OrderState state) {
        if (state is OrdersLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(StringConstant.myOrders),
            ),
            body: GradientBackground(
              image: ImagePaths.authGradientBackground,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemCount: state.orders.length,
                itemBuilder: (BuildContext context, int index) {
                  final UserOrder order = state.orders[index];
                  return SizedBox(
                    width: double.infinity,
                    child: Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(
                          Dimensions.SIZE_10,
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '${StringConstant.productCount} ${order.products.length}',
                              style: AppFonts.bold16,
                            ),
                            const SizedBox(height: Dimensions.SIZE_20),
                            _productImageCarousel(order),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                OrderPrice(order: order),
                                OrderDate(order: order)
                              ],
                            ),
                          ],
                        ),
                      )
                    ]),
                  );
                },
              ),
            ),
          );
        } else if (state is OrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(
            child: Text(
              StringConstants.error,
            ),
          );
        }
      },
    );
  }

  CarouselSlider _productImageCarousel(UserOrder order) {
    return CarouselSlider.builder(
      itemBuilder: (
        BuildContext context,
        int index,
        int realIndex,
      ) {
        return Column(
          children: <Widget>[
            Text(
              order.products[index].name,
              style: AppFonts.normal18,
              overflow: TextOverflow.ellipsis,
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                order.products[index].image,
                fit: BoxFit.fill,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  StringConstant.orderId,
                  style: AppFonts.bold12,
                ),
                TextButton(
                    onPressed: () {
                      //TODO ADD copy product ID
                    },
                    child: Row(
                      children: <Widget>[
                        Text(
                          (order.products[index].id * Dimensions.SIZE_99,)
                              .toString()
                              .substring(1, 4),
                          style: AppFonts.bold12,
                        ),
                        AppIcons.copy,
                      ],
                    )),
              ],
            ),
          ],
        );
      },
      itemCount: order.products.length,
      options: CarouselOptions(
        height: Dimensions.SIZE_300,
        clipBehavior: Clip.antiAlias,
        disableCenter: true,
        initialPage: Dimensions.SIZE_2.toInt(),
        autoPlayCurve: Curves.decelerate,
        pageSnapping: true,
        viewportFraction: Dimensions.SIZE_0_6,
        autoPlay: true,
        animateToClosest: true,
      ),
    );
  }
}
