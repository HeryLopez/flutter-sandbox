import 'package:flutter/material.dart';
import 'package:personal_site_template/themes/extensions_theme.dart';

import '../customclippers/triangle_clipper.dart';
import '../themes/theme_utils.dart';

class ImageVersusBlock extends StatelessWidget {
  const ImageVersusBlock(
      {super.key,
      required this.topColor,
      required this.bottomColor,
      this.topImagePath,
      this.bottomImagePath,
      this.topText,
      this.bottomText});

  final Color topColor;
  final Color bottomColor;
  final String? topImagePath;
  final String? bottomImagePath;
  final String? topText;
  final String? bottomText;
  final double iconSize = 38;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final styleTitle = theme.textTheme.displaySmall?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w300,
        height: 1.5,
        fontSize: 16);

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [ThemeUtils().getDefaultShadow(context)],
            color: bottomColor),
        child: Stack(
          children: [
            ClipPath(
              clipper: TriangleClipper(16),
              child: Container(
                color: topColor,
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              topImagePath!,
                              height: iconSize,
                              width: iconSize,
                              fit: BoxFit.contain,
                            ),
                            if (topText != null)
                              Text(
                                topText!,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.center,
                                style: styleTitle,
                              )
                          ],
                        ),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              bottomImagePath!,
                              height: iconSize,
                              width: iconSize,
                              fit: BoxFit.contain,
                            ),
                            if (bottomText != null)
                              Text(
                                bottomText!,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.center,
                                style: styleTitle,
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
