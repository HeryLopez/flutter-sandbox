import 'package:url_launcher/url_launcher.dart';

import '../model/app_item.dart';

class AppsDataUtils {
  static myAppsList() {
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
    return items;
  }

  static workedAppsList() {
    final List<AppItem> items = [
      AppItem(
        text: "Courses U",
        imagePath: "images/logos/coursesu.png",
        url:
        'https://play.google.com/store/apps/details?id=com.coursesu.app&hl=fr',
      ),
      AppItem(
        text: "Manpower",
        imagePath: "images/logos/manpower.png",
        url:
        'https://play.google.com/store/apps/details?id=com.manpower.interimaires&gl=FR',
      ),
      AppItem(
        text: "Rubix",
        imagePath: "images/logos/rubix.png",
        url:
        'https://play.google.com/store/apps/details?id=com.iph.orexad&gl=FR',
      ),
      AppItem(
        text: "Assura",
        imagePath: "images/logos/assura.png",
        url:
        'https://play.google.com/store/apps/details?id=com.assura.myassura&hl=fr',
      ),
      AppItem(
        text: "MSH",
        imagePath: "images/logos/msh.png",
        url:
        'https://play.google.com/store/apps/details?id=com.mysmarthealth.siaci&hl=fr',
      ),
    ];
    return items;
  }
}
