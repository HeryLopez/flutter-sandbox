import 'package:flutter/material.dart';
import 'package:personal_site_template/themes/extensions_theme.dart';

import '../themes/theme_utils.dart';

class ImageBlock extends StatelessWidget {
  const ImageBlock(
      {super.key,
      this.backgroundColor,
      this.backgroundImagePath,
      this.centralImagePath,
      required this.onBlockPressed,
      this.title});

  final Color? backgroundColor;
  final String? backgroundImagePath;
  final String? centralImagePath;
  final VoidCallback onBlockPressed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final styleBody = theme.textTheme.labelLarge
        ?.copyWith(color: theme.colorScheme.onPrimary);

    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor ?? theme.colorScheme.defaultBlockBackground,
        boxShadow: [ThemeUtils().getDefaultShadow(context)],
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              if (backgroundImagePath != null)
                Image.asset(
                  backgroundImagePath!,
                  height: double.maxFinite,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    onTap: onBlockPressed,
                    child: const SizedBox(
                      height: double.maxFinite,
                      width: double.maxFinite,
                    )),
              ),
              if (centralImagePath != null)
                Center(
                  child: Image.asset(
                    centralImagePath!,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              if (title != null)
                Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black54),
                    child: Text(
                      title!,
                      style: styleBody,
                    )),
            ],
          )),
    );
  }
}
