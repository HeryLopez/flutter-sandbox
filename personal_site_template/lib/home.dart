import 'package:flutter/material.dart';
import 'package:personal_site_template/image_block.dart';
import 'package:personal_site_template/info_block.dart';
import 'package:personal_site_template/light_bulb.dart';
import 'package:personal_site_template/photo.dart';
import 'package:personal_site_template/provider/dark_theme_state.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contact.dart';

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
                  flex: 5,
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
                  flex: 3,
                  child: Row(
                    children: const [
                      Expanded(
                          child:
                              InfoBlock(title: "2+", body: "Years Experience")),
                      SizedBox(width: 16),
                      Expanded(
                          child:
                              InfoBlock(title: "2+", body: "Years Experience")),
                      SizedBox(width: 16),
                      Expanded(
                          child:
                              InfoBlock(title: "2+", body: "Years Experience")),
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
    var darkThemeState = context.watch<DarkThemeState>();
    return Row(
      children: [
        ImageBlock(
          path: "images/instagram.png",
          onBlockPressed: () {
            const url = 'https://www.instagram.com/walkingthemilkyway/';
            _launchURL(url);
          },
        ),
        const SizedBox(width: 16),
        ImageBlock(
          path: "images/instagram.png",
          onBlockPressed: () {
            const url = 'https://www.instagram.com/walkingthemilkyway/';
            _launchURL(url);
          },
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ImageBlock(
            title: "Based in :",
            path:  darkThemeState.darkTheme ? "images/location_night.png" : "images/location_day.png",
            onBlockPressed: () {
              const url = "https://goo.gl/maps/qAEqG55SGJRhJLJr9";
              _launchURL(url);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(minWidth: 600, maxWidth: 1400),
          padding: const EdgeInsets.symmetric(horizontal: 150),
          child: ListView(
            children: [
              _buildRow1(context),
              const SizedBox(height: 16),
              _buildRow2(),
              const SizedBox(height: 16),
              _buildRow3(context),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  InfoBlock(title: "2+", body: "Years Experience"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
