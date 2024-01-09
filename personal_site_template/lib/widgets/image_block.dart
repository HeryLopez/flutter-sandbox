import 'package:flutter/material.dart';
import 'package:personal_site_template/themes/extensions_theme.dart';

import '../themes/theme_utils.dart';

class ImageBlock extends StatelessWidget {
  const ImageBlock({
    super.key,
    this.backgroundColor,
    this.backgroundImagePath,
    this.centralImagePath,
    required this.onBlockPressed,
    this.title,
    this.bodyText,
    this.backgroundGradient,
    this.isShadowEnable = true,
  });

  final Color? backgroundColor;
  final String? backgroundImagePath;
  final String? centralImagePath;
  final VoidCallback onBlockPressed;
  final String? title;
  final String? bodyText;
  final LinearGradient? backgroundGradient;
  final bool isShadowEnable;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final styleTitle = theme.textTheme.labelLarge
        ?.copyWith(color: Colors.white);

    final styleBody = theme.textTheme.labelLarge
        ?.copyWith(fontWeight: FontWeight.w100, fontSize: 12);

    Color? getBackgroundColor() {
      if (backgroundGradient == null) {
        return backgroundColor ?? theme.colorScheme.defaultBlockBackground;
      } else {
        return null;
      }
    }

    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
          borderRadius: BorderRadius.circular(16),
          color: getBackgroundColor(),
          boxShadow:
              isShadowEnable ? [ThemeUtils().getDefaultShadow(context)] : null,
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  if (backgroundImagePath != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        backgroundImagePath!,
                        height: double.maxFinite,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                    ),
                  if (centralImagePath != null)
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxHeight: 85,
                                  maxWidth: 85,
                                ),
                                child: Image.asset(
                                  centralImagePath!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            if (bodyText != null) const SizedBox(height: 6),
                            if (bodyText != null)
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.center,
                                bodyText!,
                                style: styleBody,
                              )
                          ],
                        ),
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
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: styleTitle,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
