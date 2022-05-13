import 'package:dev_guide/src/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeViewModel {
  var isDark = false;

  // Themes with get Storage
  final _storage = GetStorage();
  // Get isDarkMode info from local storage and return ThemeMode
  ThemeMode get theme => _getThemeStatus() ? ThemeMode.dark : ThemeMode.light;

  // Save isDarkMode to local storage
  _saveThemeStatus(bool isDarkMode) =>
      _storage.write(Constants.DARK_THEME_KEY, isDarkMode);

  // Load isDarkMode from local storage and if it's empty, return false (that means default theme is light)
  bool _getThemeStatus() =>
      _storage.read<bool>(Constants.DARK_THEME_KEY) ?? false;

  // switch theme and save to local storage
  void switchTheme() {
    // Get.changeThemeMode(getThemeStatus() ? ThemeMode.light : ThemeMode.dark);
    // saveThemeStatus(!getThemeStatus());

    Get.changeThemeMode(_getThemeStatus() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeStatus(!_getThemeStatus());
  }
}
