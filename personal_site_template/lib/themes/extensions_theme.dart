import 'package:flutter/material.dart';

extension CustomColorScheme on ColorScheme {
  Color get defaultBlockBackground =>
      brightness == Brightness.dark ? const Color(0xFF272727) : const Color(0xFFFFFCFB);

  Color get defaultButtonColor =>
      brightness == Brightness.dark ? Colors.deepPurpleAccent : Colors
          .blueAccent;

  Color get defaultBackgroundWindowsColor =>
      brightness == Brightness.dark ? const Color(0xFF0F0F0F) : const Color(0xFFFDF3E4);
}

