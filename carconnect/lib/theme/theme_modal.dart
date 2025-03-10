import 'package:carconnect/theme/theme_shared_preferences.dart';
import 'package:flutter/foundation.dart';



class ThemeModal extends ChangeNotifier {
  late bool _isDark;
  late ThemeSharedPreference themeSharedPreference;
  bool get isDark => _isDark;

  ThemeModal() {
    _isDark = false;
    themeSharedPreference = ThemeSharedPreference();
    getThemePreference();
  }

  set isDark(bool value) {
    _isDark = value;
    themeSharedPreference.setTheme(value);
    notifyListeners();
  }

  getThemePreference() async {
    _isDark = await themeSharedPreference.getTheme();
    notifyListeners();
  }
}
