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
      this.title,
      this.backgroundGradient});

  final Color? backgroundColor;
  final String? backgroundImagePath;
  final String? centralImagePath;
  final VoidCallback onBlockPressed;
  final String? title;
  final LinearGradient? backgroundGradient;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final styleBody = theme.textTheme.labelLarge
        ?.copyWith(color: theme.colorScheme.onPrimary);

    Color? getBackgroundColor() {
      if (backgroundGradient == null) {
        return backgroundColor ?? theme.colorScheme.defaultBlockBackground;
      } else {
        return null;
      }
    }

    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        gradient: backgroundGradient,
        borderRadius: BorderRadius.circular(16),
        color: getBackgroundColor(),
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
              if (centralImagePath != null)
                Center(
                  child: Image.asset(
                    centralImagePath!,
                    height: 85,
                    width: 85,
                    fit: BoxFit.contain,
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
                  ),
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
            ],
          )),
    );
  }
}
