import 'package:essivivi/views/client/client_nav.dart';
import 'package:essivivi/views/livreur/livreur_nav.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Navigation client : les quatre onglets répondent', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ClientNav()));

    expect(find.text('Acceuil'), findsWidgets);
    expect(find.text('Boissons'), findsWidgets);
    expect(find.text('Historique'), findsWidgets);
    expect(find.text('Profil'), findsWidgets);

    await tester.tap(find.text('Historique').last);
    await tester.pumpAndSettle();
    expect(find.text('Historique'), findsWidgets);
  });

  testWidgets('Navigation livreur : les quatre onglets répondent', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LivreurNav()));

    expect(find.text('Acceuil'), findsWidgets);
    expect(find.text('clients'), findsWidgets);
    expect(find.text('Carte'), findsWidgets);
    expect(find.text('Activité'), findsWidgets);

    await tester.tap(find.text('Activité'));
    await tester.pumpAndSettle();
    expect(find.text('activité'), findsOneWidget);
  });
}
