import 'package:flutter/material.dart';
import 'package:personal_site_template/themes/extensions_theme.dart';
import 'package:personal_site_template/utils/apps_data_utils.dart';
import 'package:personal_site_template/utils/uri_utils.dart';

import '../model/app_item.dart';
import '../scroll_behaviors/enable_mouse_scroll_behavior.dart';
import '../themes/theme_utils.dart';
import '../utils/strings.dart';
import '../widgets/image_block.dart';

class AppsWorkedBlock extends StatelessWidget {
  const AppsWorkedBlock({super.key});

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

    final List<AppItem> items = AppsDataUtils.workedAppsList();

    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [ThemeUtils().getDefaultShadow(context)],
          color: theme.colorScheme.defaultBlockBackground),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.workedAppsBlockTitle,
            maxLines: 1,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.start,
            style: styleTitle,
          ),
          const SizedBox(height: 16),
          Flexible(
            child: Scrollbar(
              thumbVisibility: true,
              controller: controller,
              child: ScrollConfiguration(
                behavior: EnableMouseScrollBehavior(),
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
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
        ],
      ),
    );
  }
}
