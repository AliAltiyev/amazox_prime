import 'package:testing/test.dart';

class TestWrapper extends StatelessWidget {
  final Widget _widget;
  const TestWrapper({
    required Widget widget,
    super.key,
  }) : _widget = widget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _widget,
      ),
    );
  }
}
