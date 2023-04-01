import 'package:flutter/material.dart';
import 'package:personal_site_template/themes/extensions_theme.dart';
import 'package:personal_site_template/utils/uri_utils.dart';

import '../themes/theme_utils.dart';
import 'image_block.dart';

class MyAppsBlock extends StatelessWidget {
  const MyAppsBlock({super.key, required this.title});

  final String title;

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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: styleTitle,
            ),
            const SizedBox(height: 16),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: ImageBlock(
                      bodyText: "Mii Collector",
                      isShadowEnable: false,
                      backgroundColor: Colors.black12,
                      centralImagePath: "images/app1.png",
                      onBlockPressed: () {
                        const url =
                            'https://play.google.com/store/apps/details?id=com.app.herydevelopments.miicollector&gl=US';
                        UriUtils.launchURL(url);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: ImageBlock(
                      bodyText: "Money Control",
                      isShadowEnable: false,
                      backgroundColor: Colors.black12,
                      centralImagePath: "images/app2.png",
                      onBlockPressed: () {
                        const url =
                            'https://play.google.com/store/apps/details?id=com.app.herydevelopments.moneycontrol&gl=IN';
                        UriUtils.launchURL(url);
                      },
                    ),
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
