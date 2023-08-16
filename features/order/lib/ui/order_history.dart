import '../bloc/order_bloc.dart';
import '../order.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<OrderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderBloc>(
      create: (context) =>
          OrderBloc(getAllUserOrders: getIt<GetAllUserOrdersUseCase>()),
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrdersLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              itemExtent: 100,
              itemCount: state.orders.length,
              itemBuilder: (BuildContext context, int index) {
                final UserOrder order = state.orders[index];

                return ListTile(
                  title: Text(order.dateTime.toString()),
                );
              },
            );
          } else if (state is OrdersLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Text('error'),
            );
          }
        },
      ),
    );
  }
}
