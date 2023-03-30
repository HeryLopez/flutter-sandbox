import 'package:flutter/material.dart';
import 'package:personal_site_template/widgets/about_block.dart';
import 'package:personal_site_template/widgets/image_block.dart';
import 'package:personal_site_template/widgets/info_block.dart';
import 'package:personal_site_template/widgets/light_bulb.dart';
import 'package:personal_site_template/widgets/photo.dart';
import 'package:personal_site_template/provider/dark_theme_state.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/contact.dart';

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

  Widget _buildRow2() {
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
                const SizedBox(height: 16),
                Expanded(
                  flex: 6,
                  child: Row(
                    children: const [
                      InfoBlock(
                        title: "10+",
                        body: "Years Experience",
                        backgroundColor: Colors.teal,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                          child: AboutBlock(
                              title: "About",
                              body:
                                  "I am passionate about development and even more about Android.\n\nIf you are interested in diplomas: I have an engineering degree and also a master's degree in management of information systems.")),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(flex: 1, child: Photo()),
        ],
      ),
    );
  }

  Widget _buildRow3(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Expanded(
        child: Row(
          children: [
            ImageBlock(
              backgroundImagePath: "images/instagram.png",
              onBlockPressed: () {
                const url = 'https://www.instagram.com/walkingthemilkyway/';
                _launchURL(url);
              },
            ),
            const SizedBox(width: 16),
            ImageBlock(
              backgroundImagePath: "images/instagram_light.png",
              onBlockPressed: () {
                const url = 'https://www.instagram.com/walkingthemilkyway/';
                _launchURL(url);
              },
            ),
            const SizedBox(width: 16),
            const InfoBlock(
              title: "10+",
              body: "Years Experience",
              backgroundColor: Colors.teal,
            ),
            const SizedBox(width: 16),
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
            centralImagePath: "images/linkedin.png",
            onBlockPressed: () {
              const url = 'https://www.instagram.com/walkingthemilkyway/';
              _launchURL(url);
            },
          ),
          const SizedBox(width: 16),
          ImageBlock(
            centralImagePath: "images/github_light.png",
            onBlockPressed: () {
              const url = 'https://www.instagram.com/walkingthemilkyway/';
              _launchURL(url);
            },
          ),
          const SizedBox(width: 16),
          Expanded(
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
            padding: const EdgeInsets.fromLTRB(150, 0, 150, 100),
            children: [
              _buildRow1(context),
              const SizedBox(height: 16),
              _buildRow2(),
              const SizedBox(height: 16),
              _buildRow3(context),
              const SizedBox(height: 16),
              _buildRow4(context),
            ],
          ),
        ),
      ),
    );
  }
}
