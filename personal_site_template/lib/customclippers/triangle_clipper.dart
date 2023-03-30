import 'package:flutter/material.dart';

class TriangleClipper extends CustomClipper<Path> {
  TriangleClipper(this.radius);

  final double radius;

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);
    path.lineTo(0, size.height - radius);
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
