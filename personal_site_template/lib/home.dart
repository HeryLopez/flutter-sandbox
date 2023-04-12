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
      messageText: Strings.contactBlockMessage,
      contactButtonText: Strings.contactBlockContactText,
      onContactPressed: () {
        UriUtils.launchURL(Strings.contactBlockUrl);
      },
    );
  }

  Widget _infoBlockName() {
    return const InfoBlock(
        title: Strings.nameBlockTitle, body: Strings.nameBlockBody);
  }

  Widget _infoBlockQuality1() {
    return const InfoBlock(
      title: Strings.quality1BlockTitle,
      textTitleColor: Colors.white,
      textBodyColor: Colors.white,
      body: Strings.quality1BlockBody,
      backgroundColor: Colors.teal,
    );
  }

  Widget _infoBlockQuality2() {
    return const InfoBlock(
      title: Strings.quality2BlockTitle,
      textTitleColor: Colors.black,
      textBodyColor: Colors.black,
      body: Strings.quality3BlockBody,
      backgroundColor: Color(0xFFFFC03D),
    );
  }

  Widget _infoBlockQuality3() {
    return const InfoBlock(
      title: Strings.quality3BlockTitle,
      textTitleColor: Colors.white,
      textBodyColor: Colors.white,
      body: Strings.quality3BlockBody,
      backgroundColor: Color(0xFFFF6D7A),
    );
  }

  Widget _imageBlockBasedIn(bool isDarkTheme) {
    return ImageBlock(
      title: Strings.baseInBlockTitle,
      backgroundImagePath: isDarkTheme
          ? Strings.baseInBlockDarkImage
          : Strings.baseInBlockLightImage,
      onBlockPressed: () {
        UriUtils.launchURL(Strings.baseInBlockUrl);
      },
    );
  }

  Widget _imageBlockSocialNetwork1(bool isDarkTheme) {
    return ImageBlock(
      centralImagePath: isDarkTheme
          ? Strings.socialNetwork1BlockDarkImage
          : Strings.socialNetwork1BlockLightImage,
      backgroundGradient:
          isDarkTheme ? ThemeUtils().getInstagramGradient() : null,
      backgroundColor: null,
      onBlockPressed: () {
        UriUtils.launchURL(Strings.socialNetwork1BlockUrl);
      },
    );
  }

  Widget _imageBlockSocialNetwork2(bool isDarkTheme) {
    return ImageBlock(
      backgroundColor: isDarkTheme ? const Color(0xFF0A66C2) : Colors.white,
      centralImagePath: isDarkTheme
          ? Strings.socialNetwork2BlockDarkImage
          : Strings.socialNetwork2BlockLightImage,
      onBlockPressed: () {
        UriUtils.launchURL(Strings.socialNetwork2BlockUrl);
      },
    );
  }

  Widget _imageBlockSocialNetwork3(bool isDarkTheme) {
    return ImageBlock(
      centralImagePath: isDarkTheme
          ? Strings.socialNetwork3BlockDarkImage
          : Strings.socialNetwork3BlockLightImage,
      onBlockPressed: () {
        UriUtils.launchURL(Strings.socialNetwork3BlockUrl);
      },
    );
  }

  Widget _imageVersusBlock() {
    return const ImageVersusBlock(
      title: Strings.versusBlockTitle,
      topColor: Color(0xFF3EDA84),
      bottomColor: Color(0xFF62C8F9),
      topText: Strings.versusBlockTopText,
      bottomText: Strings.versusBlockBottomText,
      topImagePath: Strings.versusBlockTopImage,
      bottomImagePath: Strings.versusBlockBottomImage,
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
        Strings.footerText,
        textAlign: TextAlign.end,
        style: styleTitle,
      ),
    );
  }

  _itemBigVersionBuilder(BuildContext context, int index, bool isDarkTheme) {
    switch (index) {
      case 0:
        return _lightBulbBlock(context);
      case 1:
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
              const SizedBox(width: Dimensions.spacing),
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
                      child: _imageBlockBasedIn(isDarkTheme),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      case 2:
        return SizedBox(
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
        );
      case 3:
        return SizedBox(
          height: 250,
          child: Row(
            children: [
              _imageBlockSocialNetwork1(isDarkTheme),
              const SizedBox(width: Dimensions.spacing),
              _imageBlockSocialNetwork2(isDarkTheme),
              const SizedBox(width: Dimensions.spacing),
              const Expanded(
                flex: 1,
                child: AppsWorkedBlock(),
              ),
            ],
          ),
        );
      case 4:
        return SizedBox(
          height: 250,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _imageBlockSocialNetwork3(isDarkTheme),
              const SizedBox(width: Dimensions.spacing),
              Expanded(
                flex: 1,
                child: _footerBlock(context),
              )
            ],
          ),
        );
    }
  }

  Widget _buildBigVersion(BuildContext context, bool isDarkTheme) {
    final ScrollController controller = ScrollController();
    final screenWidth = MediaQuery.of(context).size.width;
    double listWidth = 50.0;
    if (screenWidth > 1400) {
      listWidth = ((screenWidth - 1400) / 2);
    }
    return Scrollbar(
      thumbVisibility: true,
      controller: controller,
      child: ScrollConfiguration(
        behavior: EnableMouseScrollBehavior().copyWith(scrollbars: false),
        child: ListView.separated(
          padding: EdgeInsets.fromLTRB(listWidth, 0, listWidth, 100),
          controller: controller,
          itemCount: 5,
          scrollDirection: Axis.vertical,
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: Dimensions.spacing),
          itemBuilder: (BuildContext context, int index) =>
              _itemBigVersionBuilder(context, index, isDarkTheme),
        ),
      ),
    );
  }

  _itemMiddleVersionBuilder(BuildContext context, int index, bool isDarkTheme) {
    switch (index) {
      case 0:
        return _lightBulbBlock(context);
      case 1:
        return SizedBox(
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
                      child: _imageBlockBasedIn(isDarkTheme),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      case 2:
        return const SizedBox(
          height: 210,
          child: AboutBlock(
            title: Strings.aboutTitle,
            body: Strings.aboutMe,
          ),
        );
      case 3:
        return SizedBox(
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
        );
      case 4:
        return SizedBox(
          height: 220,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(flex: 2, child: MyAppsBlock()),
              const SizedBox(width: Dimensions.spacing),
              Expanded(flex: 1, child: _imageVersusBlock()),
            ],
          ),
        );
      case 5:
        return const SizedBox(
          height: 220,
          child: AppsWorkedBlock(),
        );
      case 6:
        return SizedBox(
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _imageBlockSocialNetwork1(isDarkTheme),
              ),
              const SizedBox(width: Dimensions.spacing),
              Expanded(
                child: _imageBlockSocialNetwork2(isDarkTheme),
              ),
              const SizedBox(width: Dimensions.spacing),
              Expanded(
                child: _imageBlockSocialNetwork3(isDarkTheme),
              ),
            ],
          ),
        );
      case 7:
        return _footerBlock(context);
    }
  }

  Widget _buildMiddleVersion(BuildContext context, bool isDarkTheme) {
    final ScrollController controller = ScrollController();

    return Scrollbar(
      thumbVisibility: true,
      controller: controller,
      child: ScrollConfiguration(
        behavior: EnableMouseScrollBehavior().copyWith(scrollbars: false),
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 100),
          controller: controller,
          itemCount: 8,
          scrollDirection: Axis.vertical,
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: Dimensions.spacing),
          itemBuilder: (BuildContext context, int index) =>
              _itemMiddleVersionBuilder(context, index, isDarkTheme),
        ),
      ),
    );
  }

  _itemSmallVersionBuilder(BuildContext context, int index, bool isDarkTheme) {
    switch (index) {
      case 0:
        return _lightBulbBlock(context);
      case 1:
        return SizedBox(height: 110, child: _infoBlockName());
      case 2:
        return const PhotoBlock();
      case 3:
        return _imageBlockBasedIn(isDarkTheme);
      case 4:
        return const SizedBox(
          height: 270,
          child: AboutBlock(
            title: Strings.aboutTitle,
            body: Strings.aboutMe,
          ),
        );
      case 5:
        return SizedBox(
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
        );
      case 6:
        return SizedBox(
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
        );
      case 7:
        return _contactBlock();
      case 8:
        return SizedBox(
          height: 200,
          child: _imageVersusBlock(),
        );
      case 9:
        return const SizedBox(
          height: 220,
          child: MyAppsBlock(),
        );
      case 10:
        return const SizedBox(
          height: 220,
          child: AppsWorkedBlock(),
        );
      case 11:
        return SizedBox(
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _imageBlockSocialNetwork1(isDarkTheme),
              ),
              const SizedBox(width: Dimensions.spacing),
              Expanded(
                child: _imageBlockSocialNetwork2(isDarkTheme),
              ),
            ],
          ),
        );
      case 12:
        return SizedBox(
          height: 200,
          child: _footerBlock(context),
        );
    }
  }

  Widget _buildSmallVersion(BuildContext context, bool isDarkTheme) {
    final ScrollController controller = ScrollController();

    return Scrollbar(
      thumbVisibility: true,
      controller: controller,
      child: ScrollConfiguration(
        behavior: EnableMouseScrollBehavior().copyWith(scrollbars: false),
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
          controller: controller,
          itemCount: 12,
          scrollDirection: Axis.vertical,
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: Dimensions.spacing),
          itemBuilder: (BuildContext context, int index) =>
              _itemSmallVersionBuilder(context, index, isDarkTheme),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var darkThemeState = context.watch<DarkThemeState>();

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth >= 1150) {
            return _buildBigVersion(context, darkThemeState.darkTheme);
          } else if (constraints.maxWidth >= 600 &&
              constraints.maxWidth < 1150) {
            return _buildMiddleVersion(context, darkThemeState.darkTheme);
          } else {
            return _buildSmallVersion(context, darkThemeState.darkTheme);
          }
        },
      ),
    );
  }
}
