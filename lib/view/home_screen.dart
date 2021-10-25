import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_todo_app/controller/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            _themeController.swichTheme();
          },
          child: Icon(Icons.mode_night),
        ),
      ),
      body: Center(
        child: Text("Welcome to"),
      ),
    );
  }
}
