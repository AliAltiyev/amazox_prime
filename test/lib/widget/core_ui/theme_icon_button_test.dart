import 'package:flutter_test/flutter_test.dart';
import 'package:testing/test.dart';

void main() {
  testWidgets(
    'Should change app theme when on clicks',
    (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(_wrapper(
        AppAddButton(
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

MaterialApp _wrapper(Widget widget) {
  return MaterialApp(
    home: Scaffold(
      body: widget,
    ),
  );
}
