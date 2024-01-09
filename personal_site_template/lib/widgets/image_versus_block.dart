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
      this.bottomText,
      this.title});

  final String? title;
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

    final styleBody = theme.textTheme.labelLarge?.copyWith(
      color: Colors.white,
    );

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [ThemeUtils().getDefaultShadow(context)],
            color: bottomColor),
        child: Stack(
          children: [
            ClipPath(
              clipper: TriangleClipper(16, TriangleClipperMode.slash),
              child: Container(
                color: topColor,
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        child: IconText(
                            imagePath: topImagePath,
                            iconSize: iconSize,
                            text: topText,
                            styleText: styleTitle),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: IconText(
                            imagePath: bottomImagePath,
                            iconSize: iconSize,
                            text: bottomText,
                            styleText: styleTitle),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                )
              ],
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
          ],
        ));
  }
}

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.imagePath,
    required this.iconSize,
    required this.text,
    required this.styleText,
  });

  final String? imagePath;
  final double iconSize;
  final String? text;
  final TextStyle? styleText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath!,
          height: iconSize,
          width: iconSize,
          fit: BoxFit.contain,
        ),
        if (text != null)
          Text(
            text!,
            maxLines: 1,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            style: styleText,
          )
      ],
    );
  }
}
