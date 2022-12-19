import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BlurCircle extends StatelessWidget {
  const BlurCircle(this.color, this.x, this.y, this.z, {super.key});

  final Color color;
  final double x;
  final double y;
  final double z;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: color,
      ),
      transform: Matrix4.translationValues(x, y, z),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 100.0,
          sigmaY: 100.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.0),
          ),
        ),
      ),
    );
  }
}
