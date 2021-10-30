import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sqflite_todo_app/app/theme.dart';
import 'package:sqflite_todo_app/constents.dart';
import 'package:sqflite_todo_app/controller/notification_controller.dart';
import 'package:sqflite_todo_app/controller/theme_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ThemeController _themeController = Get.put(ThemeController());
  var notifyController;
  DateTime _selectedDate = DateTime.now();
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
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            _addtaskBar(),
            SizedBox(
              height: 20,
            ),
            _addDateBar()
          ],
        ),
      ),
    );
  }

  DatePicker _addDateBar() {
    return DatePicker(
      DateTime.now(),
      selectionColor: primaryClr,
      selectedTextColor: whiteClr,
      height: 100,
      width: 80,
      initialSelectedDate: DateTime.now(),
      onDateChange: (date) {
        _selectedDate = date;
      },
    );
  }

  _addtaskBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMd().format(DateTime.now()),
              style: subHeadingStyle,
            ),
            Text(
              "Today",
              style: headingStyle,
            )
          ],
        ),
        SizedBox(
          height: 40,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryClr)),
            onPressed: null,
            child: TextButton.icon(
              onPressed: null,
              icon: Icon(Icons.add),
              label: Text('Add Task'),
            ),
          ),
        ),
      ],
    );
  }
}
