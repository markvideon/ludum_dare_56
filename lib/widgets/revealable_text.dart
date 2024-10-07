import 'package:flutter/material.dart';
import 'package:ludum_dare_56/widgets/masked_text.dart';

class RevealableText extends StatelessWidget {
  const RevealableText({
    required this.isRevealed,
    required this.text,
    this.style,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final bool isRevealed;

  @override
  Widget build(BuildContext context) {
    if (isRevealed) {
      return Text(text, style: style);
    } else {
      return MaskedText(text: text, style: style);
    }
  }
}
