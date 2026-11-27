import 'package:material_ui/material_ui.dart';

import '../auth_theme.dart';

/// Profil de la vague : chaque écran peut avoir des crêtes plus ou moins hautes.
enum WaveProfile { signIn, signUp }

/// En-tête vert avec bordure inférieure en vague et ombre portée douce.
class WaveHeader extends StatelessWidget {
  const WaveHeader({
    super.key,
    required this.height,
    required this.title,
    this.profile = WaveProfile.signIn,
  });

  final double height;
  final String title;
  final WaveProfile profile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(
        painter: _LiquidWavePainter(profile: profile),
        child: SafeArea(
          child: Align(
            alignment: const Alignment(0, -0.25),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Curve {
  const _Curve(this.x1, this.y1, this.x2, this.y2, this.x3, this.y3);

  final double x1;
  final double y1;
  final double x2;
  final double y2;
  final double x3;
  final double y3;
}

/// Vague de connexion : crêtes marquées (y faible = crête haute).
const List<_Curve> _signInCurves = [
  _Curve(0.08, 0.92, 0.16, 0.66, 0.25, 0.74),
  _Curve(0.34, 0.82, 0.40, 0.90, 0.50, 0.72),
  _Curve(0.60, 0.60, 0.66, 0.98, 0.78, 0.86),
  _Curve(0.88, 0.68, 0.94, 0.72, 1.00, 0.80),
];

/// Vague d'inscription : ondulations plus douces et moins hautes.
const List<_Curve> _signUpCurves = [
  _Curve(0.10, 0.86, 0.18, 0.76, 0.28, 0.80),
  _Curve(0.38, 0.84, 0.44, 0.88, 0.54, 0.80),
  _Curve(0.64, 0.72, 0.70, 0.92, 0.82, 0.84),
  _Curve(0.90, 0.78, 0.95, 0.80, 1.00, 0.82),
];

class _LiquidWavePainter extends CustomPainter {
  const _LiquidWavePainter({required this.profile});

  final WaveProfile profile;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();
    final double w = size.width;
    final double h = size.height;
    final List<_Curve> curves =
        profile == WaveProfile.signIn ? _signInCurves : _signUpCurves;
    final double startY = profile == WaveProfile.signIn ? 0.78 : 0.80;

    path.lineTo(0, h * startY);
    for (final curve in curves) {
      path.cubicTo(
        w * curve.x1, h * curve.y1,
        w * curve.x2, h * curve.y2,
        w * curve.x3, h * curve.y3,
      );
    }
    path.lineTo(w, 0);
    path.close();

    // Ombre diffuse sous la vague (effet « papier découpé »).
    canvas.drawShadow(path, Colors.black.withValues(alpha: 0.28), 10.0, true);

    final Paint paint = Paint()
      ..color = AuthColors.green
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _LiquidWavePainter oldDelegate) =>
      oldDelegate.profile != profile;
}
