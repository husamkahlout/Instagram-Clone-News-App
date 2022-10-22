import 'package:flutter/material.dart';
import 'package:instagram_ui/todo_app/providers/tasks_provider.dart';
import 'package:instagram_ui/todo_app/providers/tasks_provider.dart';
import 'package:instagram_ui/todo_app/views/components/task_widget.dart';
import 'package:provider/provider.dart';

class CompletedTasks extends StatelessWidget {
   CompletedTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context,tasksProvider, x) {
        return ListView.builder(
          itemCount: tasksProvider.completedTasks.length,
          itemBuilder: (BuildContext context, int index) {
            return TaskWidget(tasksProvider.completedTasks[index]);
          },
        );
      }
    );
  }
}
