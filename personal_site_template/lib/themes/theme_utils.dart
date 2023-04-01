import 'package:flutter/material.dart';

class ThemeUtils {
  BoxShadow getDefaultShadow(BuildContext context) {
    final theme = Theme.of(context);

    return theme.brightness == Brightness.light
        ? const BoxShadow(
            color: Colors.black12,
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(3, 3), // changes position of shadow
          )
        : const BoxShadow(color: Colors.transparent);
  }

  LinearGradient getInstagramGradient() {
    return const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xFF7638FA),
        Color(0xFFD300C5),
        Color(0xFFFF0069),
        Color(0xFFFF7A00),
        Color(0xFFFFD600),
      ],
    );
  }
}
