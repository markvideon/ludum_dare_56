import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' show radians;

class Streaks extends StatelessWidget {
  const Streaks({
    required this.colors,
    super.key,
  });

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StreakPainter(
        colors,
      ),
      child: const SizedBox.expand(),
    );
  }
}

class StreakPainter extends CustomPainter {
  const StreakPainter(this.colors);

  final List<Color> colors;

  static const sliceCount = 24;
  static const increment = 360 / sliceCount;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    final rect = Rect.fromCenter(
      center: Offset(0.5 * size.width, 0.5 * size.height),
      width: 1.5 * size.width,
      height: 1.5 * size.height,
    );

    for (int i = 0; i < sliceCount; i++) {
      paint.color = colors[i % colors.length];
      canvas.drawArc(rect, radians(i * increment), radians(increment), true, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}