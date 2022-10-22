import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_ui/todo_app/models/task_model.dart';
import 'package:instagram_ui/todo_app/views/screens/completed_tasks.dart';

class TasksProvider extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  List<TaskModel> allTasks = [];
  List<TaskModel> completedTasks = [];
  List<TaskModel> inCompletedTasks = [];

  getCompletedTasks() {
    completedTasks = allTasks.where((element) => element.isComplete).toList();
    inCompletedTasks =
        allTasks.where((element) => !element.isComplete).toList();
  }

  changeCheckBox(TaskModel taskModel) {
    taskModel.isComplete = !taskModel.isComplete;
    getCompletedTasks();
    notifyListeners();
    // int index = tasks.indexOf(taskModel);
    // tasks[index].isComplete = !tasks[index].isComplete;
  }

  addNewTask(TaskModel taskModel) {
    allTasks.add(taskModel);
    getCompletedTasks();
    notifyListeners();
  }

  removeTask(TaskModel taskModel) {
    allTasks.remove(taskModel);
    getCompletedTasks();
    notifyListeners();
  }

  editTask(TaskModel taskModel) {
    taskModel.title = titleController.text;
    notifyListeners();
  }
}
