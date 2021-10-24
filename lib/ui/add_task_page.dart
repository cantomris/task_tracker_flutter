import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_tracker_flutter/services/theme_services.dart';
import 'package:task_tracker_flutter/ui/theme.dart';
import 'package:task_tracker_flutter/ui/widgets/input_box.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('HH:mm').format(DateTime.now()).toString();
  String _endTime = DateFormat('HH:mm')
      .format(DateTime.now().add(const Duration(hours: 2)))
      .toString();
  List<int> remindTimeList = [5, 10, 15, 20, 30];
  int _selectedRemindTime = 5;
  List<String> repeatTimeList = [
    'None',
    'Daily',
    'Weekly',
    'Monthly',
    'Annually'
  ];
  String _selectedRepeatTime = 'None';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Tasks',
                style: headerDayStyle,
              ),
              const InputField(
                title: 'Title',
                hint: 'Enter title here',
              ),
              const InputField(
                title: 'Note',
                hint: 'Enter note here',
              ),
              InputField(
                title: 'Date',
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: const Icon(Icons.calendar_today_outlined,
                      color: Colors.grey),
                  onPressed: () {
                    debugPrint('clicked');
                    _popUpCalendar();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: 'Start Time',
                      hint: _startTime,
                      widget: IconButton(
                        icon: const Icon(Icons.watch_later_outlined,
                            color: Colors.grey),
                        onPressed: () {
                          debugPrint('clicked');
                          _getTimeFromUser(isStartTime: true);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InputField(
                      title: 'End Time',
                      hint: _endTime,
                      widget: IconButton(
                        icon: const Icon(Icons.watch_later, color: Colors.grey),
                        onPressed: () {
                          debugPrint('clicked');
                          _getTimeFromUser(isStartTime: false);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              InputField(
                title: 'Remind',
                hint: "$_selectedRemindTime minutes early",
                widget: DropdownButton(
                  icon:
                      const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(height: 0),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRemindTime = int.parse(newValue!);
                    });
                  },
                  items:
                      remindTimeList.map<DropdownMenuItem<String>>((int value) {
                    return DropdownMenuItem<String>(
                        value: value.toString(), child: Text(value.toString()));
                  }).toList(),
                ),
              ),
              InputField(
                title: 'Repeat',
                hint: _selectedRepeatTime,
                widget: DropdownButton(
                  icon:
                      const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(height: 0),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRepeatTime = newValue!;
                    });
                  },
                  items: repeatTimeList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios,
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

  _popUpCalendar() async {
    // TODO - First day of the week
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2023));
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      debugPrint('The date is null or something went wrong');
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker(isStartTime: isStartTime);
    String _formattedTime = pickedTime.format(context);
    if (pickedTime == null) {
      debugPrint('Time selection cancelled');
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formattedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formattedTime;
      });
    }
  }

  _showTimePicker({required bool isStartTime}) {
    return showTimePicker(
      // TODO - Disable AM / PM
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: TimeOfDay.now(),
      // initialTime: TimeOfDay(
      //     hour: isStartTime == true
      //         ? int.parse(_startTime.split(':')[0])
      //         : int.parse(_endTime.split(':')[0]),
      //     minute: int.parse(_startTime.split(':')[1].split(' ')[0])),
    );
  }
}
