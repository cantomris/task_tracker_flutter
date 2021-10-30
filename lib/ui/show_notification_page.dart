import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class NotifiedPage extends StatelessWidget {
  final String? label;
  const NotifiedPage({Key? key, required this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context),
        body: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Get.isDarkMode ? Colors.white : Colors.grey[400]),
          child: Center(
            child: Text(label.toString().split('|')[1],
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                    fontSize: 16)),
          ),
        ));
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
      title: Text(label.toString().split('|')[0],
          style: const TextStyle(color: Colors.green)),
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
}
// TODO - get task from SQL
