import 'package:flutter/material.dart';
import 'package:personal_site_template/themes/extensions_theme.dart';
import 'package:personal_site_template/utils/uri_utils.dart';

import '../model/app_item.dart';
import '../scrollbehaviors/enable_mouse_scroll_behavior.dart';
import '../themes/theme_utils.dart';
import 'image_block.dart';

class MyAppsBlock extends StatelessWidget {
  const MyAppsBlock({super.key, required this.title});

  final String title;

  _itemBuilder(BuildContext context, AppItem item) {
    return ImageBlock(
      bodyText: item.text,
      isShadowEnable: false,
      backgroundColor: Colors.black12,
      centralImagePath: item.imagePath,
      onBlockPressed: () {
        UriUtils.launchURL(item.url);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final styleTitle =
        theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold);

    final ScrollController controller = ScrollController();

    final List<AppItem> items = [
      AppItem(
        text: "Mii Collector",
        imagePath: "images/app1.png",
        url:
            'https://play.google.com/store/apps/details?id=com.app.herydevelopments.miicollector&gl=US',
      ),
      AppItem(
        text: "Money Control",
        imagePath: "images/app2.png",
        url:
            'https://play.google.com/store/apps/details?id=com.app.herydevelopments.moneycontrol&gl=IN',
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [ThemeUtils().getDefaultShadow(context)],
          color: theme.colorScheme.defaultBlockBackground),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                child: Center(
                  child: ListView.separated(
                    shrinkWrap: true,
                    controller: controller,
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(width: 16),
                    itemBuilder: (BuildContext context, int index) =>
                        _itemBuilder(context, items[index]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
