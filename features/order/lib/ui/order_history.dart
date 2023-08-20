import 'package:core/enums/currency.dart';

import '../order.dart';

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
              elevation: 0,
              title: Text('Мои покупки'),
            ),
            body: GradientBackground(
              image: ImagePaths.authGradientBackground,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider();
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
                          children: [
                            Text(
                              'Количествo товаров: ${order.products.length}',
                              style: AppFonts.bold16,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CarouselSlider.builder(
                              itemBuilder: (context, index, realIndex) {
                                return Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        order.products[index].name,
                                        style: AppFonts.normal18,
                                      ),
                                      Card(
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.network(
                                          order.products[index].image,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Артикул: '),
                                          TextButton(
                                              onPressed: () {
                                                //TODO ADD copy articul
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    (order.products[index].id *
                                                            99)
                                                        .toString(),
                                                  ),
                                                  Icon(Icons.copy),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: order.products.length,
                              options: CarouselOptions(
                                height: 300,
                                clipBehavior: Clip.antiAlias,
                                disableCenter: true,
                                initialPage: 2,
                                autoPlayCurve: Curves.decelerate,
                                pageSnapping: true,
                                viewportFraction: 0.6,
                                autoPlay: true,
                                animateToClosest: true,
                              ),
                            ),
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
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: Text('error'),
          );
        }
      },
    );
  }
}

class OrderDate extends StatelessWidget {
  const OrderDate({
    super.key,
    required this.order,
  });

  final UserOrder order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Дата',
          style: AppFonts.bold14,
        ),
        Text(order.dateTime),
      ],
    );
  }
}

class OrderPrice extends StatelessWidget {
  const OrderPrice({
    super.key,
    required this.order,
  });

  final UserOrder order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Сумма',
          style: AppFonts.bold14,
        ),
        Text('${order.price.toString()} ${Currency.rubl.name}')
      ],
    );
  }
}
