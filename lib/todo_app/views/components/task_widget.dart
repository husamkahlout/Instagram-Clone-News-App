import 'package:flutter/material.dart';
import 'package:instagram_ui/todo_app/models/task_model.dart';
import 'package:instagram_ui/todo_app/providers/tasks_provider.dart';
import 'package:instagram_ui/todo_app/views/screens/edit_task.dart';
import 'package:provider/provider.dart';

class TaskWidget extends StatelessWidget {
  TaskModel taskModel;
  TaskWidget(this.taskModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(builder: (context, tasksProvider, x) {
      return GestureDetector(
        onDoubleTap: () {
          tasksProvider.removeTask(taskModel);
        },
        onLongPress: () {
          tasksProvider.titleController.text = taskModel.title ?? "";
          Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
            return EditTask(taskModel);
          })));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CheckboxListTile(
            value: taskModel.isComplete,
            onChanged: ((value) {
              tasksProvider.changeCheckBox(taskModel);
            }),
            title: Text(taskModel.title ?? "not define",
                style: taskModel.isComplete
                    ? TextStyle(
                        color: Colors.grey[600],
                        decoration: TextDecoration.lineThrough)
                    : const TextStyle()),
          ),
        ),
      );
    });
  }
}
