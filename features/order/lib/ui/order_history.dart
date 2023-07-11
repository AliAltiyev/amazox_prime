import 'package:core_ui/constants/string.dart';
import 'package:order/order.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<OrderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        StringConstant.order,
      ),
    );
  }
}
