import 'package:material_ui/material_ui.dart';

import '../auth_theme.dart';

/// Lien de bas d'écran : « Don't have an account? Signup ».
class BottomAuthLink extends StatelessWidget {
  const BottomAuthLink({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onTap,
  });

  final String promptText;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          promptText,
          style: const TextStyle(color: AuthColors.textMuted, fontSize: 12.5),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: const TextStyle(
              color: AuthColors.green,
              fontSize: 12.5,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: AuthColors.green,
            ),
          ),
        ),
      ],
    );
  }
}
