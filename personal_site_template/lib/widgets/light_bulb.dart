import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_glow/flutter_glow.dart';
import 'package:personal_site_template/themes/extensions_theme.dart';

import '../themes/theme_utils.dart';

class LightBulb extends StatelessWidget {
  const LightBulb(
      {super.key, required this.onLightBulbPress, required this.isOn});

  final VoidCallback onLightBulbPress;
  final bool isOn;
  final glowColor = const Color(0xFFecd461);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          boxShadow: [ThemeUtils().getDefaultShadow(context)],
          color: theme.colorScheme.defaultBlockBackground),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isOn ? glowColor : Colors.black,
            ),
            child: const SizedBox(
              width: 6,
              height: 45,
            ),
          ),
          Transform.rotate(
            angle: 180 * math.pi / 180,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: onLightBulbPress,
              color: Colors.white,
              iconSize: 48,
              icon: GlowIcon(
                isOn ? Icons.lightbulb : Icons.lightbulb_outline,
                color: isOn ? glowColor : Colors.black,
                glowColor: isOn ? glowColor : Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
