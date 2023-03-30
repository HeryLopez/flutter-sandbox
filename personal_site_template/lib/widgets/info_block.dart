import 'package:flutter/material.dart';
import 'package:personal_site_template/themes/extensions_theme.dart';

import '../themes/theme_utils.dart';

class InfoBlock extends StatelessWidget {
  const InfoBlock(
      {super.key,
      required this.title,
      required this.body,
      this.backgroundColor,
      this.textColor});

  final String title;
  final String body;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final styleTitle = theme.textTheme.displaySmall?.copyWith(
        color: textColor ?? theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
        height: 1,
        fontSize: 35);

    final styleBody = theme.textTheme.titleLarge?.copyWith(
        color: textColor ?? theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w100,
        height: 1,
        fontSize: 16);

    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [ThemeUtils().getDefaultShadow(context)],
          color: backgroundColor ?? theme.colorScheme.defaultBlockBackground),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            style: styleTitle,
          ),
          const SizedBox(height: 6),
          Text(
            body,
            maxLines: 2,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            style: styleBody,
          ),
        ],
      ),
    );
  }
}
