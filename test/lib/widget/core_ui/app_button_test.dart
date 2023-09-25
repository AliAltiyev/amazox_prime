import 'package:flutter_test/flutter_test.dart';
import 'package:testing/test.dart';

void main() {
  testWidgets(
    'test app button',
    (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(TestWrapper(
        widget: PrimaryAppButton(
          icon: Icons.add,
          onPress: () {},
        ),
      ));
      Finder button = find.byType(GestureDetector);
      expect(button, findsOneWidget);
      Finder icon = find.byIcon(AppIcons.increment);
      expect(
        icon,
        findsOneWidget,
      );
      await widgetTester.tap(
        button,
        warnIfMissed: false,
      );
      await widgetTester.pump();
      expect(
        button,
        findsOneWidget,
      );
    },
  );
}
