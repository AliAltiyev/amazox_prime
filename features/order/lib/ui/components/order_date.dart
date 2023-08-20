import '../../order.dart';

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
          StringConstant.date,
          style: AppFonts.bold14,
        ),
        Text(
          order.dateTime,
        ),
      ],
    );
  }
}
