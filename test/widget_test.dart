import 'package:flutter_test/flutter_test.dart';

import 'package:mobile/main.dart';

void main() {
  testWidgets('App loads without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const NegoreservaApp());
    expect(find.byType(NegoreservaApp), findsOneWidget);
  });
}
