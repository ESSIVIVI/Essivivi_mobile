import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:essivivi/main.dart';

void main() {
  testWidgets('Affiche l\'écran de connexion', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Sign In'), findsOneWidget);
    expect(find.text('Welcome Back!'), findsOneWidget);
    expect(find.text('Log In'), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);
    expect(find.byIcon(Icons.lock), findsOneWidget);
  });

  testWidgets('Ouvre l\'écran d\'inscription depuis le lien', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Signup'));
    await tester.pumpAndSettle();

    expect(find.text('Hey, Welcome!'), findsOneWidget);
    expect(find.text('Enter 8-digit Password'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);
  });
}
