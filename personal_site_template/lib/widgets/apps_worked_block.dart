import 'package:flutter/material.dart';
import 'package:personal_site_template/themes/extensions_theme.dart';
import 'package:personal_site_template/utils/uri_utils.dart';

import '../scrollbehaviors/enable_mouse_scroll_behavior.dart';
import '../themes/theme_utils.dart';
import 'image_block.dart';

class AppsWorkedBlock extends StatelessWidget {
  const AppsWorkedBlock({super.key, required this.title});

  final String title;

  _itemBuilder(BuildContext context, int index) {
    return ImageBlock(
      bodyText: "Courses U",
      isShadowEnable: false,
      backgroundColor: Colors.black12,
      centralImagePath: "images/app1.png",
      onBlockPressed: () {
        const url =
            'https://play.google.com/store/apps/details?id=com.coursesu.app&hl=fr';
        UriUtils.launchURL(url);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final styleTitle =
        theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold);

    final ScrollController controller = ScrollController();

    final List<AppsWorkedItem> items = [
      AppsWorkedItem(
        text: "Courses U",
        imagePath: "images/app1.png",
        url:
            'https://play.google.com/store/apps/details?id=com.coursesu.app&hl=fr',
      ),
      AppsWorkedItem(
        text: "Courses U",
        imagePath: "images/app1.png",
        url:
            'https://play.google.com/store/apps/details?id=com.coursesu.app&hl=fr',
      ),
      AppsWorkedItem(
        text: "Courses U",
        imagePath: "images/app1.png",
        url:
            'https://play.google.com/store/apps/details?id=com.coursesu.app&hl=fr',
      ),
      AppsWorkedItem(
        text: "Courses U",
        imagePath: "images/app1.png",
        url:
            'https://play.google.com/store/apps/details?id=com.coursesu.app&hl=fr',
      ),
      AppsWorkedItem(
        text: "Courses U",
        imagePath: "images/app1.png",
        url:
            'https://play.google.com/store/apps/details?id=com.coursesu.app&hl=fr',
      ),
    ];

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
              child: Scrollbar(
                thumbVisibility: true,
                child: ScrollConfiguration(
                  behavior: EnableMouseScrollBehavior(),
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                    controller: controller,
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(width: 16),
                    itemBuilder: (BuildContext context, int index) =>
                        _itemBuilder(context, index),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppsWorkedItem {
  String text;
  String imagePath;
  String url;

  AppsWorkedItem({
    required this.text,
    required this.imagePath,
    required this.url,
  });
}
