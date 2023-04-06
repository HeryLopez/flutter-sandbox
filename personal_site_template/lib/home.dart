import 'package:flutter/material.dart';
import 'package:personal_site_template/scroll_behaviors/enable_mouse_scroll_behavior.dart';
import 'package:personal_site_template/themes/theme_utils.dart';
import 'package:personal_site_template/utils/dimensions.dart';
import 'package:personal_site_template/utils/strings.dart';
import 'package:personal_site_template/utils/uri_utils.dart';
import 'package:personal_site_template/widgets/about_block.dart';
import 'package:personal_site_template/static_widgets/apps_worked_block.dart';
import 'package:personal_site_template/widgets/contact_block.dart';
import 'package:personal_site_template/widgets/image_block.dart';
import 'package:personal_site_template/widgets/image_versus_block.dart';
import 'package:personal_site_template/widgets/info_block.dart';
import 'package:personal_site_template/widgets/light_bulb.dart';
import 'package:personal_site_template/static_widgets/my_apps_block.dart';
import 'package:personal_site_template/provider/dark_theme_state.dart';
import 'package:personal_site_template/widgets/photo_block.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _lightBulbBlock(BuildContext context) {
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

  Widget _contactBlock({int? maxLines}) {
    return ContactBlock(
      maxLines: maxLines,
      messageText: "Bring your ideas and let's make it happen",
      contactButtonText: "Contact me 👋",
      onContactPressed: () {
        const url = "https://goo.gl/maps/qAEqG55SGJRhJLJr9";
        UriUtils.launchURL(url);
      },
    );
  }

  Widget _infoBlockName() {
    return const InfoBlock(
      title: "Hery Lopez",
      body: "Mobile App Developer",
    );
  }

  Widget _infoBlockQuality1() {
    return const InfoBlock(
      title: "10+",
      body: "Years Dev\nExperience",
      backgroundColor: Colors.teal,
    );
  }

  Widget _infoBlockQuality2() {
    return const InfoBlock(
      title: "5+",
      textTitleColor: Colors.black,
      textBodyColor: Colors.black,
      body: "Years Mobile\nDev Experience",
      backgroundColor: Color(0xFFFFC03D),
    );
  }

  Widget _infoBlockQuality3() {
    return const InfoBlock(
      title: "10+",
      body: "different projects (Apps)",
      backgroundColor: Color(0xFFFF6D7A),
    );
  }

  Widget _imageBlockBasedIn(bool isDarkTheme) {
    return ImageBlock(
      title: "Based in :",
      backgroundImagePath:
          isDarkTheme ? "images/location_night.png" : "images/location_day.png",
      onBlockPressed: () {
        const url = "https://goo.gl/maps/qAEqG55SGJRhJLJr9";
        UriUtils.launchURL(url);
      },
    );
  }

  Widget _imageBlockSocialNetwork1(bool isDarkTheme) {
    return ImageBlock(
      centralImagePath: isDarkTheme
          ? "images/instagram_night.png"
          : "images/instagram_light.png",
      backgroundGradient:
          isDarkTheme ? ThemeUtils().getInstagramGradient() : null,
      backgroundColor: null,
      onBlockPressed: () {
        const url = 'https://www.instagram.com/walkingthemilkyway/';
        UriUtils.launchURL(url);
      },
    );
  }

  Widget _imageBlockSocialNetwork2(bool isDarkTheme) {
    return ImageBlock(
      backgroundColor: isDarkTheme ? const Color(0xFF0A66C2) : Colors.white,
      centralImagePath:
          isDarkTheme ? "images/linkedin_night.png" : "images/linkedin_day.png",
      onBlockPressed: () {
        const url = 'https:www.linkedin.com/in/hery-lopez-r';
        UriUtils.launchURL(url);
      },
    );
  }

  Widget _imageBlockSocialNetwork3(bool isDarkTheme) {
    return ImageBlock(
      centralImagePath:
          isDarkTheme ? "images/github_night.png" : "images/github_light.png",
      onBlockPressed: () {
        const url = 'https://github.com/HeryLopez';
        UriUtils.launchURL(url);
      },
    );
  }

  Widget _imageVersusBlock() {
    return const ImageVersusBlock(
      title: "I work with :",
      topColor: Color(0xFF3EDA84),
      bottomColor: Color(0xFF62C8F9),
      topText: "Android",
      bottomText: "Flutter",
      topImagePath: "images/android.png",
      bottomImagePath: "images/flutter.png",
    );
  }

  Widget _footerBlock(BuildContext context) {
    final theme = Theme.of(context);
    final styleTitle = theme.textTheme.titleLarge
        ?.copyWith(fontWeight: FontWeight.w300, height: 1, fontSize: 14);
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      alignment: Alignment.bottomRight,
      child: Text(
        "Hery Lopez since 1990 from Colombia\nlicensed under \"if you want to copy the code, copy it, it's on my Github\"\nv1.0.0",
        textAlign: TextAlign.end,
        style: styleTitle,
      ),
    );
  }

  Widget _buildBigVersion(BuildContext context) {
    var darkThemeState = context.watch<DarkThemeState>();
    final ScrollController controller = ScrollController();
    return Scrollbar(
      thumbVisibility: true,
      controller: controller,
      child: ScrollConfiguration(
        behavior: EnableMouseScrollBehavior().copyWith(scrollbars: false),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 100),
          controller: controller,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 1400),
                    child: Column(
                      children: [
                        _lightBulbBlock(context),
                        const SizedBox(height: Dimensions.spacing),
                        SizedBox(
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
                                      child: _contactBlock(maxLines: 2),
                                    ),
                                    const SizedBox(height: Dimensions.spacing),
                                    Expanded(
                                      flex: 6,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: _infoBlockQuality1(),
                                          ),
                                          const SizedBox(
                                              width: Dimensions.spacing),
                                          Expanded(
                                            child: _infoBlockQuality2(),
                                          ),
                                          const SizedBox(
                                              width: Dimensions.spacing),
                                          Expanded(
                                            flex: 1,
                                            child: _infoBlockQuality3(),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: Dimensions.spacing),
                              const Expanded(
                                flex: 1,
                                child: PhotoBlock(),
                              ),
                              const SizedBox(width: Dimensions.spacing),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: _infoBlockName(),
                                    ),
                                    const SizedBox(height: Dimensions.spacing),
                                    Expanded(
                                      flex: 2,
                                      child: _imageBlockBasedIn(
                                          darkThemeState.darkTheme),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: Dimensions.spacing),
                        SizedBox(
                          height: 240,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Expanded(
                                  flex: 6,
                                  child: AboutBlock(
                                    title: Strings.aboutTitle,
                                    body: Strings.aboutMe,
                                  )),
                              const SizedBox(width: Dimensions.spacing),
                              Expanded(
                                flex: 3,
                                child: _imageVersusBlock(),
                              ),
                              const SizedBox(width: Dimensions.spacing),
                              const Expanded(
                                flex: 4,
                                child: MyAppsBlock(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: Dimensions.spacing),
                        SizedBox(
                          height: 250,
                          child: Row(
                            children: [
                              _imageBlockSocialNetwork1(
                                  darkThemeState.darkTheme),
                              const SizedBox(width: Dimensions.spacing),
                              _imageBlockSocialNetwork2(
                                  darkThemeState.darkTheme),
                              const SizedBox(width: Dimensions.spacing),
                              const Expanded(
                                flex: 1,
                                child: AppsWorkedBlock(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: Dimensions.spacing),
                        SizedBox(
                          height: 250,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _imageBlockSocialNetwork3(
                                  darkThemeState.darkTheme),
                              const SizedBox(width: Dimensions.spacing),
                              Expanded(
                                flex: 1,
                                child: _footerBlock(context),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiddleVersion(BuildContext context) {
    final ScrollController controller = ScrollController();
    var darkThemeState = context.watch<DarkThemeState>();
    return Scrollbar(
      thumbVisibility: true,
      controller: controller,
      child: ScrollConfiguration(
        behavior: EnableMouseScrollBehavior().copyWith(scrollbars: false),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 100),
          controller: controller,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(children: [
                    _lightBulbBlock(context),
                    const SizedBox(height: Dimensions.spacing),
                    SizedBox(
                      height: 470,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: PhotoBlock(),
                          ),
                          const SizedBox(width: Dimensions.spacing),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: _infoBlockName(),
                                ),
                                const SizedBox(height: Dimensions.spacing),
                                Expanded(
                                  flex: 2,
                                  child: _imageBlockBasedIn(
                                      darkThemeState.darkTheme),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Dimensions.spacing),
                    const SizedBox(
                      height: 210,
                      child: AboutBlock(
                        title: Strings.aboutTitle,
                        body: Strings.aboutMe,
                      ),
                    ),
                    const SizedBox(height: Dimensions.spacing),
                    SizedBox(
                      height: 470,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child: _contactBlock(maxLines: 2),
                          ),
                          const SizedBox(height: Dimensions.spacing),
                          Expanded(
                            flex: 6,
                            child: Row(
                              children: [
                                Expanded(
                                  child: _infoBlockQuality1(),
                                ),
                                const SizedBox(width: Dimensions.spacing),
                                Expanded(
                                  child: _infoBlockQuality2(),
                                ),
                                const SizedBox(width: Dimensions.spacing),
                                Expanded(
                                  flex: 1,
                                  child: _infoBlockQuality3(),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: Dimensions.spacing),
                    SizedBox(
                      height: 220,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Expanded(flex: 2, child: MyAppsBlock()),
                          const SizedBox(width: Dimensions.spacing),
                          Expanded(flex: 1, child: _imageVersusBlock()),
                        ],
                      ),
                    ),
                    const SizedBox(height: Dimensions.spacing),
                    const SizedBox(
                      height: 220,
                      child: AppsWorkedBlock(),
                    ),
                    const SizedBox(height: Dimensions.spacing),
                    SizedBox(
                      height: 200,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: _imageBlockSocialNetwork1(
                                darkThemeState.darkTheme),
                          ),
                          const SizedBox(width: Dimensions.spacing),
                          Expanded(
                            child: _imageBlockSocialNetwork2(
                                darkThemeState.darkTheme),
                          ),
                          const SizedBox(width: Dimensions.spacing),
                          Expanded(
                            child: _imageBlockSocialNetwork3(
                                darkThemeState.darkTheme),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Dimensions.spacing),
                    _footerBlock(context),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallVersion(BuildContext context) {
    final ScrollController controller = ScrollController();
    var darkThemeState = context.watch<DarkThemeState>();
    return Scrollbar(
      thumbVisibility: true,
      controller: controller,
      child: ScrollConfiguration(
        behavior: EnableMouseScrollBehavior().copyWith(scrollbars: false),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 100),
          controller: controller,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _lightBulbBlock(context),
                      const SizedBox(height: Dimensions.spacing),
                      SizedBox(
                        height: 110,
                        child: _infoBlockName(),
                      ),
                      const SizedBox(height: Dimensions.spacing),
                      const PhotoBlock(),
                      const SizedBox(height: Dimensions.spacing),
                      _imageBlockBasedIn(darkThemeState.darkTheme),
                      const SizedBox(height: Dimensions.spacing),
                      const SizedBox(
                        height: 270,
                        child: AboutBlock(
                          title: Strings.aboutTitle,
                          body: Strings.aboutMe,
                        ),
                      ),
                      const SizedBox(height: Dimensions.spacing),
                      SizedBox(
                        height: 120,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: _infoBlockQuality1(),
                            ),
                            const SizedBox(width: Dimensions.spacing),
                            Expanded(
                              child: _infoBlockQuality2(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Dimensions.spacing),
                      SizedBox(
                        height: 110,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              flex: 1,
                              child: _infoBlockQuality3(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Dimensions.spacing),
                      _contactBlock(),
                      const SizedBox(height: Dimensions.spacing),
                      SizedBox(
                        height: 200,
                        child: _imageVersusBlock(),
                      ),
                      const SizedBox(height: Dimensions.spacing),
                      const SizedBox(
                        height: 220,
                        child: MyAppsBlock(),
                      ),
                      const SizedBox(height: Dimensions.spacing),
                      const SizedBox(
                        height: 220,
                        child: AppsWorkedBlock(),
                      ),
                      const SizedBox(height: Dimensions.spacing),
                      SizedBox(
                        height: 200,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: _imageBlockSocialNetwork1(
                                  darkThemeState.darkTheme),
                            ),
                            const SizedBox(width: Dimensions.spacing),
                            Expanded(
                              child: _imageBlockSocialNetwork2(
                                  darkThemeState.darkTheme),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Dimensions.spacing),
                      SizedBox(
                        height: 200,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              flex: 1,
                              child: _imageBlockSocialNetwork3(
                                  darkThemeState.darkTheme),
                            ),
                            const SizedBox(width: Dimensions.spacing),
                            const Expanded(flex: 1, child: SizedBox()),
                          ],
                        ),
                      ),
                      const SizedBox(height: Dimensions.spacing),
                      SizedBox(
                        height: 200,
                        child: Expanded(
                          flex: 1,
                          child: _footerBlock(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth >= 1150) {
            return _buildBigVersion(context);
          } else if (constraints.maxWidth >= 650 &&
              constraints.maxWidth < 1150) {
            return _buildMiddleVersion(context);
          } else {
            return _buildSmallVersion(context);
          }
        },
      ),
    );
  }
}
