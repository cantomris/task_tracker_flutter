import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_tracker_flutter/services/notification_services.dart';
import 'package:task_tracker_flutter/services/theme_services.dart';
import 'package:task_tracker_flutter/ui/theme.dart';
import 'package:task_tracker_flutter/ui/widgets/button.dart';

import 'add_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  dynamic notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: Column(
        children: [_mainHeader(), _dateSelector()],
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          ThemeServices().switchTheme();
          notifyHelper.displayNotification(
              title: 'New Notification',
              body: Get.isDarkMode
                  ? 'Activated Light Mode'
                  : 'Activated Dark Mode');
          notifyHelper.scheduledNotification();
        },
        child: Icon(Icons.nightlight_round,
            size: 20, color: Get.isDarkMode ? Colors.white : Colors.black),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/Avatar.jpg'),
        ),
        // Icon(Icons.person, size: 20),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  _mainHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMd().format(DateTime.now()),
                  style: headerDateStyle),
              Text('Today', style: headerDayStyle)
            ],
          ),
          MyButton(
              label: "+ New Task",
              onTap: () => Get.to(() => const AddTaskPage())),
        ],
      ),
    );
  }

  _dateSelector() {
    return Container(
        margin: const EdgeInsets.only(left: 20),
        child: DatePicker(
          DateTime.now(),
          height: 90,
          width: 65,
          initialSelectedDate: DateTime.now(),
          selectionColor: customPrimaryColor,
          selectedTextColor: Colors.white,
          dateTextStyle: customDateStyle,
          dayTextStyle: customDayStyle,
          monthTextStyle: customMonthStyle,
          onDateChange: (date) {
            _selectedDate = date;
            debugPrint(_selectedDate.toString());
          },
        ));
  }
}
