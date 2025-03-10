import 'package:shared_preferences/shared_preferences.dart' as sp;

class ThemeSharedPreference {
  // ignore: constant_identifier_names
  static const PREF_KEY = "preference";

  setTheme(bool value) async {
    sp.SharedPreferences sharedPreferences = await sp.SharedPreferences.getInstance();
    sharedPreferences.setBool(PREF_KEY, value);
  }

  getTheme() async {
    sp.SharedPreferences sharedPreferences = await sp.SharedPreferences.getInstance();
    return sharedPreferences.getBool(PREF_KEY) ?? false;
  }
}
