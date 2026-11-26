import 'package:material_ui/material_ui.dart';

import 'sign_in_screen.dart';

/// Point d'entrée historique de l'authentification.
/// Délègue désormais à l'écran de connexion complet.
class Connection extends StatelessWidget {
  const Connection({super.key});

  @override
  Widget build(BuildContext context) => const SignInScreen();
}
