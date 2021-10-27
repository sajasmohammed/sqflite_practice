import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_todo_app/controller/notification_controller.dart';
import 'package:sqflite_todo_app/controller/theme_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ThemeController _themeController = Get.put(ThemeController());
  var notifyController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyController = NotifyController();
    notifyController.initializeNotification();
    notifyController.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            _themeController.swichTheme();
            notifyController.displayNotification(
                title: 'Theme Chaged',
                body: Get.isDarkMode
                    ? "Activated Dark Theme"
                    : "Activated Light Theme");

            notifyController.scheduledNotification();
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
