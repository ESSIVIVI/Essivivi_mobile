import 'package:material_ui/material_ui.dart';

import '../auth_theme.dart';

/// En-tête vert avec bordure inférieure en vague et ombre portée douce.
class WaveHeader extends StatelessWidget {
  const WaveHeader({
    super.key,
    required this.height,
    required this.title,
  });

  final double height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(
        painter: const _LiquidWavePainter(),
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

class _LiquidWavePainter extends CustomPainter {
  const _LiquidWavePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();
    final double w = size.width;
    final double h = size.height;

    path.lineTo(0, h * 0.76);

    // Quatre courbes de Bézier : ondulations asymétriques de la maquette.
    path.cubicTo(w * 0.08, h * 0.90, w * 0.16, h * 0.72, w * 0.25, h * 0.76);
    path.cubicTo(w * 0.34, h * 0.80, w * 0.40, h * 0.88, w * 0.50, h * 0.77);
    path.cubicTo(w * 0.60, h * 0.66, w * 0.66, h * 0.96, w * 0.78, h * 0.82);
    path.cubicTo(w * 0.88, h * 0.70, w * 0.94, h * 0.73, w, h * 0.79);

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
  bool shouldRepaint(covariant _LiquidWavePainter oldDelegate) => false;
}
