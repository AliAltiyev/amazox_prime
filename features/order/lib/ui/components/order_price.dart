import 'package:core/enums/currency.dart';
import 'package:order/order.dart';

class OrderPrice extends StatelessWidget {
  const OrderPrice({
    required this.order,
    super.key,
  });

  final UserOrder order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          StringConstant.total,
          style: AppFonts.bold14,
        ),
        Text('${order.price.toString()} ${Currency.rubl.name}')
      ],
    );
  }
}
