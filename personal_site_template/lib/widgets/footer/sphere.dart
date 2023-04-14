import 'package:flutter/material.dart';

class Sphere extends StatelessWidget {
  const Sphere({
    super.key,
    required this.size,
    required this.gradientColors,
    required this.gradientStops,
  });

  final double size;
  final List<double>? gradientStops;
  final List<Color> gradientColors;

  RadialGradient _getSmokeGradient() {
    return RadialGradient(
      center: const Alignment(-0.4, -0.4),
      stops: gradientStops,
      colors: gradientColors,
    );
  }

  BoxShadow _getBoxShadow() {
    return BoxShadow(
      color: Colors.black.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 7,
      offset: const Offset(5, 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: _getSmokeGradient(),
          boxShadow: [_getBoxShadow()],
        ),
        child: SizedBox(height: size, width: size));
  }
}
