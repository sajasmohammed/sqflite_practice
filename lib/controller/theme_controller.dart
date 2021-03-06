import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  // final _box = GetStorage();
  // final _key = "isDarkMode";
  bool _isDarkMode = true;

  // bool _loadThemeFromBox() => _box.read(_key) ?? false;
  // _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  ThemeMode get theme => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void swichTheme() { 
    Get.changeThemeMode(_isDarkMode ? ThemeMode.light:ThemeMode.dark );
    // _saveThemeToBox(!_loadThemeFromBox());
    _isDarkMode = !_isDarkMode;
  }
}
