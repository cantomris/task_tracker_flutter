import 'package:get/get.dart';
import 'package:task_tracker_flutter/db/db_helper.dart';
import 'package:task_tracker_flutter/models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }

  void deleteTask(Task task) async {
    DBHelper.deleteTask(task);
  }

  void completeTask(int id) async {
    DBHelper.completeTask(id);
  }
}
