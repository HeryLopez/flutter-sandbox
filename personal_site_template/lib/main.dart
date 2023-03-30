import 'package:flutter/material.dart';
import 'package:personal_site_template/provider/dark_theme_state.dart';
import 'package:personal_site_template/themes/custom_theme.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeState darkThemeState = DarkThemeState();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    darkThemeState.darkTheme =
        await darkThemeState.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => darkThemeState,
      child: Consumer<DarkThemeState>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            title: "Hery's site",
            darkTheme: customDarkTheme(),
            theme: customLightTheme(),
            themeMode:
                darkThemeState.darkTheme ? ThemeMode.dark : ThemeMode.light,
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}
