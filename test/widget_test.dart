import 'package:flutter_test/flutter_test.dart';
import 'package:eco_education_app/main.dart';

void main() {
  testWidgets('EcoEducationApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const EcoEducationApp());
    expect(find.text('इको शिक्षण'), findsOneWidget);
    expect(find.text('खेळातून पर्यावरण शिक्षण'), findsOneWidget);
  });
}
