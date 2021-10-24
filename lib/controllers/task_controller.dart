import 'package:get/get.dart';
import 'package:task_tracker_flutter/db/db_helper.dart';
import 'package:task_tracker_flutter/models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }
}
