import 'package:flutter/material.dart';

class MaskedText extends StatelessWidget {
  const MaskedText({
    required this.text,
    this.style,
    super.key,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ShaderMask(
      shaderCallback: (bounds) =>
        const LinearGradient(
          colors: [
            Colors.transparent,
            Colors.black,
          ],
          begin: Alignment.center,
          end: Alignment.center,
        ).createShader(bounds),
      child: Text(
        text,
        style: style ?? textTheme.headlineLarge,
      ),
    );
  }
}
