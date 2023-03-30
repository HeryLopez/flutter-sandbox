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
}
