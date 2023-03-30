import 'package:flutter/material.dart';
import 'package:personal_site_template/themes/extensions_theme.dart';

import '../themes/theme_utils.dart';

class AboutBlock extends StatelessWidget {
  const AboutBlock({super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final styleTitle =
        theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold);

    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [ThemeUtils().getDefaultShadow(context)],
          color: theme.colorScheme.defaultBlockBackground),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.start,
            style: styleTitle,
          ),
          const SizedBox(height: 12),
          Text(
            body,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
