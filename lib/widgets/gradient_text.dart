/// Created by Amin BADH on 15 Jun, 2022 *

import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText(this.text, {required this.gradient, this.style, Key? key}) : super(key: key);

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
