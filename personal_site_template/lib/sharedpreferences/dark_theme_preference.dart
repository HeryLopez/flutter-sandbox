import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const SELECTED_THEME = "SELECTED_THEME";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SELECTED_THEME, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SELECTED_THEME) ?? false;
  }
}