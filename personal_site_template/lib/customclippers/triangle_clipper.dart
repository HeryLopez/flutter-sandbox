import 'package:flutter/material.dart';

class TriangleClipper extends CustomClipper<Path> {
  TriangleClipper(this.radius, this.mode);

  final double radius;
  final TriangleClipperMode mode;

  _versionSlash(Size size) {
    final path = Path();
    path.lineTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - radius, size.height);
    path.lineTo(radius, 0);
    path.close();
    return path;
  }

  _versionBackSlash(Size size) {
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
  Path getClip(Size size) {
    return mode == TriangleClipperMode.slash
        ? _versionSlash(size)
        : _versionBackSlash(size);
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}

enum TriangleClipperMode { slash, backslash }
