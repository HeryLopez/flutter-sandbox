import 'package:flutter/material.dart';
import 'package:personal_site_template/themes/theme_utils.dart';
import 'package:personal_site_template/utils/dimensions.dart';
import 'package:personal_site_template/widgets/about_block.dart';
import 'package:personal_site_template/widgets/contact.dart';
import 'package:personal_site_template/widgets/image_block.dart';
import 'package:personal_site_template/widgets/image_versus_block.dart';
import 'package:personal_site_template/widgets/info_block.dart';
import 'package:personal_site_template/widgets/light_bulb.dart';
import 'package:personal_site_template/widgets/photo.dart';
import 'package:personal_site_template/provider/dark_theme_state.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

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
    return SizedBox(
      height: 450,
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
                      print("Contact");
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
                          textColor: Colors.black,
                          body: "Years Mobile\nDev Experience",
                          backgroundColor: Color(0xFFFFC03D),
                        ),
                      ),
                      SizedBox(width: Dimensions.spacing),
                      Expanded(
                        child: ImageVersusBlock(
                          topColor: Color(0xFF3EDA84),
                          bottomColor: Color(0xFF62C8F9),
                          topText: "Android",
                          bottomText: "Flutter",
                          topImagePath: "images/android.png",
                          bottomImagePath: "images/flutter.png",
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(
                  flex: 1,
                  child: InfoBlock(
                    title: "10+",
                    body: "Years Dev\nExperience",
                    backgroundColor: Colors.teal,
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
                      _launchURL(url);
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
    var darkThemeState = context.watch<DarkThemeState>();
    return SizedBox(
      height: 220,
      child: Expanded(
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
                _launchURL(url);
              },
            ),
            const SizedBox(width: Dimensions.spacing),
            const InfoBlock(
              title: "10+",
              body: "Years Experience",
              backgroundColor: Colors.teal,
            ),
            const SizedBox(width: Dimensions.spacing),
            const Expanded(
                child: AboutBlock(
                    title: "About",
                    body:
                        "I am passionate about development and even more about Android.\n\nIf you are interested in diplomas: I have an engineering degree and also a master's degree in management of information systems.")),
          ],
        ),
      ),
    );
  }

  Widget _buildRow4(BuildContext context) {
    var darkThemeState = context.watch<DarkThemeState>();
    return SizedBox(
      height: 220,
      child: Row(
        children: [
          ImageBlock(
            backgroundColor: darkThemeState.darkTheme
                ? const Color(0xFF0A66C2)
                : Colors.white,
            centralImagePath: darkThemeState.darkTheme
                ? "images/linkedin_night.png"
                : "images/linkedin_day.png",
            onBlockPressed: () {
              const url = 'https:www.linkedin.com/in/hery-lopez-r';
              _launchURL(url);
            },
          ),
          const SizedBox(width: Dimensions.spacing),
          ImageBlock(
            centralImagePath: darkThemeState.darkTheme
                ? "images/github_night.png"
                : "images/github_light.png",
            onBlockPressed: () {
              const url = 'https://github.com/HeryLopez';
              _launchURL(url);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            ],
          ),
        ),
      ),
    );
  }
}
