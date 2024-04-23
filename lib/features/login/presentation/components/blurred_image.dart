import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class BlurredImage extends StatelessWidget {
  const BlurredImage(this.image, {super.key, this.opacity = 0.0});

  final String image;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image).blurred(colorOpacity: opacity);
  }
}
