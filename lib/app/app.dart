import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_todo_app/app/theme.dart';
import 'package:sqflite_todo_app/controller/theme_controller.dart';
import 'package:sqflite_todo_app/view/home_screen.dart';

class App extends StatelessWidget {
  final ThemeController _themeController=Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: _themeController.theme,
      home: HomeScreen(),
    );
  }
}
