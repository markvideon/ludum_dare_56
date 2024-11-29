import 'package:flutter/material.dart';
import 'package:ludum_dare_56/widgets/rotator.dart';
import 'package:ludum_dare_56/widgets/streaks.dart';

class NeutralBackground extends StatelessWidget {
  const NeutralBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Rotator(
      child: Streaks(
        colors: [
          Colors.green,
          Colors.white,
        ],
      ),
    );
  }
}

class VictoryBackground extends StatelessWidget {
  const VictoryBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Rotator(
      child: Streaks(
        colors: [
          Colors.pink,
          Colors.green,
          Colors.yellow,
          Colors.green,
          Colors.purple,
          Colors.green,
          Colors.blue,
          Colors.green,
        ],
      ),
    );
  }
}
