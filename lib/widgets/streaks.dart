import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' show radians, degrees;
import 'dart:math';

class Streaks extends StatelessWidget {
  const Streaks({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StreakPainter(),
      child: const SizedBox.expand(),
    );
  }
}

class StreakPainter extends CustomPainter {
  final colors = [
    Colors.pink,
    Colors.green,
    Colors.yellow,
    Colors.green,
    Colors.purple,
    Colors.green,
    Colors.blue,
    Colors.green,
  ];

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