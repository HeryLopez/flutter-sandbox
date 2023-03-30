import 'package:flutter/material.dart';

extension CustomColorScheme on ColorScheme {
  Color get defaultBlockBackground =>
      brightness == Brightness.dark ? Colors.white10 : const Color(0xFFFFFCFB);

  Color get defaultButtonColor =>
      brightness == Brightness.dark ? Colors.deepPurpleAccent : Colors
          .blueAccent;
}

