import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaskedText extends StatelessWidget {
  const MaskedText({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
