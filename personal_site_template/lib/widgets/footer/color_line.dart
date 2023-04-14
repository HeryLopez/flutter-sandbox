import 'package:flutter/material.dart';

class ColorLine extends StatelessWidget {
  const ColorLine({super.key, required this.color, required this.height});

  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(height: height, width: double.infinity, color: color);
  }
}
