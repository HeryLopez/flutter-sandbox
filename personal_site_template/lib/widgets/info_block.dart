import 'package:flutter/material.dart';
import 'package:personal_site_template/themes/extensions_theme.dart';

import '../themes/theme_utils.dart';

class InfoBlock extends StatelessWidget {
  const InfoBlock(
      {super.key,
      required this.title,
      required this.body,
      this.backgroundColor});

  final String title;
  final String body;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final styleTitle = theme.textTheme.displayMedium
        ?.copyWith(color: theme.colorScheme.onPrimary);

    final styleBody = theme.textTheme.titleLarge
        ?.copyWith(color: theme.colorScheme.onPrimary);

    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [ThemeUtils().getDefaultShadow(context)],
          color: backgroundColor ?? theme.colorScheme.defaultBlockBackground),
      child: Column(
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
            maxLines: 1,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            style: styleBody,
          ),
        ],
      ),
    );
  }
}
