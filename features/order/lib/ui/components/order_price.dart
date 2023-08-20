import 'package:core/enums/currency.dart';

import '../../order.dart';

class OrderPrice extends StatelessWidget {
  const OrderPrice({
    super.key,
    required this.order,
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
