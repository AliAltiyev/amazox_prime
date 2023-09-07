import 'package:flutter_test/flutter_test.dart';
import 'package:testing/test.dart';

void main() {
  final TextEditingController textEditingController = TextEditingController();
  const String testText = 'test';
  testWidgets(
    'test app text field',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        TestWrapper(
          widget: AppTextField(
            controller: textEditingController,
          ),
        ),
      );

      Finder finder = find.byType(TextField);
      expect(
        finder,
        findsOneWidget,
      );
      await tester.enterText(
        find.byType(TextField),
        testText,
      );
      expect(
        textEditingController.text,
        testText,
      );
    },
  );
}
