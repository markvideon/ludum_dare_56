import 'package:flutter/cupertino.dart';

class Rotator extends StatefulWidget {
  const Rotator({required this.child, super.key});

  final Widget child;
  @override
  State<StatefulWidget> createState() => _RotatorState();
}

class _RotatorState extends State<Rotator> with SingleTickerProviderStateMixin {
  late final AnimationController animator;

  @override
  void initState() {
    super.initState();
    animator = AnimationController(vsync: this)
      ..repeat(min: 0, max: 1, period: const Duration(seconds: 30));
  }
  @override
  dispose() {
    animator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animator,
      builder: (_, __) {
        return Transform.rotate(
          angle: animator.value,
          child: widget.child,
        );
      });
  }
}
