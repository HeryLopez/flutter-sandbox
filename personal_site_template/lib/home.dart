import 'package:flutter/material.dart';
import 'package:personal_site_template/themes/extensions_theme.dart';
import 'package:personal_site_template/themes/theme_utils.dart';
import 'package:personal_site_template/utils/dimensions.dart';
import 'package:personal_site_template/utils/strings.dart';
import 'package:personal_site_template/utils/uri_utils.dart';
import 'package:personal_site_template/widgets/about_block.dart';
import 'package:personal_site_template/widgets/apps_worked_block.dart';
import 'package:personal_site_template/widgets/contact.dart';
import 'package:personal_site_template/widgets/image_block.dart';
import 'package:personal_site_template/widgets/image_versus_block.dart';
import 'package:personal_site_template/widgets/info_block.dart';
import 'package:personal_site_template/widgets/light_bulb.dart';
import 'package:personal_site_template/widgets/my_apps_block.dart';
import 'package:personal_site_template/widgets/photo.dart';
import 'package:personal_site_template/provider/dark_theme_state.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildRow1(BuildContext context) {
    var darkThemeState = context.watch<DarkThemeState>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        LightBulb(
          onLightBulbPress: () {
            darkThemeState.darkTheme = !darkThemeState.darkTheme;
          },
          isOn: darkThemeState.darkTheme,
        ),
      ],
    );
  }

  Widget _buildRow2(BuildContext context) {
    var darkThemeState = context.watch<DarkThemeState>();
    final theme = Theme.of(context);
    return SizedBox(
      height: 470,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: Contact(
                    messageText: "Do you have any idea to work together?",
                    contactButtonText: "Contact me 👋",
                    onContactPressed: () {
                      const url = "https://goo.gl/maps/qAEqG55SGJRhJLJr9";
                      UriUtils.launchURL(url);
                    },
                  ),
                ),
                const SizedBox(height: Dimensions.spacing),
                Expanded(
                  flex: 6,
                  child: Row(
                    children: const [
                      Expanded(
                        child: InfoBlock(
                          title: "10+",
                          body: "Years Dev\nExperience",
                          backgroundColor: Colors.teal,
                        ),
                      ),
                      SizedBox(width: Dimensions.spacing),
                      Expanded(
                        child: InfoBlock(
                          title: "5+",
                          textTitleColor: Colors.black,
                          textBodyColor: Colors.black,
                          body: "Years Mobile\nDev Experience",
                          backgroundColor: Color(0xFFFFC03D),
                        ),
                      ),
                      SizedBox(width: Dimensions.spacing),
                      Expanded(
                        flex: 1,
                        child: InfoBlock(
                          title: "10+",
                          body: "different projects (Apps)",
                          backgroundColor: Color(0xFFFF6D7A),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: Dimensions.spacing),
          const Expanded(flex: 1, child: Photo()),
          const SizedBox(width: Dimensions.spacing),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: InfoBlock(
                    title: "Hery Lopez",
                    body: "Mobile App Developer",
                  ),
                ),
                const SizedBox(height: Dimensions.spacing),
                Expanded(
                  flex: 2,
                  child: ImageBlock(
                    title: "Based in :",
                    backgroundImagePath: darkThemeState.darkTheme
                        ? "images/location_night.png"
                        : "images/location_day.png",
                    onBlockPressed: () {
                      const url = "https://goo.gl/maps/qAEqG55SGJRhJLJr9";
                      UriUtils.launchURL(url);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow3(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Expanded(
              flex: 5,
              child: AboutBlock(
                title: Strings.aboutTitle,
                body: Strings.aboutMe,
              )),
          SizedBox(width: Dimensions.spacing),
          Expanded(
            flex: 3,
            child: ImageVersusBlock(
              title: "I work with :",
              topColor: Color(0xFF3EDA84),
              bottomColor: Color(0xFF62C8F9),
              topText: "Android",
              bottomText: "Flutter",
              topImagePath: "images/android.png",
              bottomImagePath: "images/flutter.png",
            ),
          ),
          SizedBox(width: Dimensions.spacing),
          Expanded(
            flex: 3,
            child: MyAppsBlock(
              title: "My Apps",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow4(BuildContext context) {
    var darkThemeState = context.watch<DarkThemeState>();
    return SizedBox(
      height: 250,
      child: Row(
        children: [
          ImageBlock(
            centralImagePath: darkThemeState.darkTheme
                ? "images/instagram_night.png"
                : "images/instagram_light.png",
            backgroundGradient: darkThemeState.darkTheme
                ? ThemeUtils().getInstagramGradient()
                : null,
            backgroundColor: null,
            onBlockPressed: () {
              const url = 'https://www.instagram.com/walkingthemilkyway/';
              UriUtils.launchURL(url);
            },
          ),
          const SizedBox(width: Dimensions.spacing),
          ImageBlock(
            backgroundColor: darkThemeState.darkTheme
                ? const Color(0xFF0A66C2)
                : Colors.white,
            centralImagePath: darkThemeState.darkTheme
                ? "images/linkedin_night.png"
                : "images/linkedin_day.png",
            onBlockPressed: () {
              const url = 'https:www.linkedin.com/in/hery-lopez-r';
              UriUtils.launchURL(url);
            },
          ),
          const SizedBox(width: Dimensions.spacing),
          const Expanded(
              flex: 1,
              child: AppsWorkedBlock(
                title: "Some apps I work(ed) on",
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var darkThemeState = context.watch<DarkThemeState>();
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(minWidth: 600, maxWidth: 1400),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 100),
            children: [
              _buildRow1(context),
              const SizedBox(height: Dimensions.spacing),
              _buildRow2(context),
              const SizedBox(height: Dimensions.spacing),
              _buildRow3(context),
              const SizedBox(height: Dimensions.spacing),
              _buildRow4(context),
              const SizedBox(height: Dimensions.spacing),
              Container(
                height: 250,
                child: Row(
                  children: [
                    ImageBlock(
                      centralImagePath: darkThemeState.darkTheme
                          ? "images/github_night.png"
                          : "images/github_light.png",
                      onBlockPressed: () {
                        const url = 'https://github.com/HeryLopez';
                        UriUtils.launchURL(url);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
